'use strict';

/**
 * Planes.js controller
 *
 * @description: A set of functions called "actions" for managing `Planes`.
 */

module.exports = {

  /**
   * Retrieve planes records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.planes.search(ctx.query);
    } else {
      return strapi.services.planes.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a planes record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.planes.fetch(ctx.params);
  },

  /**
   * Count planes records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.planes.count(ctx.query, populate);
  },

  /**
   * Create a/an planes record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.planes.add(ctx.request.body);
  },

  /**
   * Update a/an planes record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.planes.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an planes record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.planes.remove(ctx.params);
  }
};
