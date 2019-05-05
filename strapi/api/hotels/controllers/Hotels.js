'use strict';

/**
 * Hotels.js controller
 *
 * @description: A set of functions called "actions" for managing `Hotels`.
 */

module.exports = {

  /**
   * Retrieve hotels records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.hotels.search(ctx.query);
    } else {
      return strapi.services.hotels.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a hotels record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.hotels.fetch(ctx.params);
  },

  /**
   * Count hotels records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.hotels.count(ctx.query, populate);
  },

  /**
   * Create a/an hotels record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.hotels.add(ctx.request.body);
  },

  /**
   * Update a/an hotels record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.hotels.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an hotels record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.hotels.remove(ctx.params);
  }
};
