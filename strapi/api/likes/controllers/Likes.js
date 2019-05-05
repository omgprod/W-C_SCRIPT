'use strict';

/**
 * Likes.js controller
 *
 * @description: A set of functions called "actions" for managing `Likes`.
 */

module.exports = {

  /**
   * Retrieve likes records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.likes.search(ctx.query);
    } else {
      return strapi.services.likes.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a likes record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.likes.fetch(ctx.params);
  },

  /**
   * Count likes records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.likes.count(ctx.query, populate);
  },

  /**
   * Create a/an likes record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.likes.add(ctx.request.body);
  },

  /**
   * Update a/an likes record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.likes.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an likes record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.likes.remove(ctx.params);
  }
};
