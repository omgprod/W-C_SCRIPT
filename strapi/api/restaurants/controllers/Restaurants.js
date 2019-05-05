'use strict';

/**
 * Restaurants.js controller
 *
 * @description: A set of functions called "actions" for managing `Restaurants`.
 */

module.exports = {

  /**
   * Retrieve restaurants records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.restaurants.search(ctx.query);
    } else {
      return strapi.services.restaurants.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a restaurants record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.restaurants.fetch(ctx.params);
  },

  /**
   * Count restaurants records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.restaurants.count(ctx.query, populate);
  },

  /**
   * Create a/an restaurants record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.restaurants.add(ctx.request.body);
  },

  /**
   * Update a/an restaurants record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.restaurants.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an restaurants record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.restaurants.remove(ctx.params);
  }
};
