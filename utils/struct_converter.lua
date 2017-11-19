package.path = "../?.lua;" .. package.path

local qlua = require("qlua.api")
local utils = require("utils.utils")

local assert = assert
local tostring = assert(tostring)
local error = assert(error)

local value_to_string_or_empty_string = assert(utils.value_to_string_or_empty_string)
local value_or_empty_string = assert(utils.value_or_empty_string)

local StructConverter = {
  _VERSION = '0.2.0', 
  getMoney = {}, 
  getDepo = {}, 
  getTradeDate = {}
}

function StructConverter.getMoney.Money(money, existing_struct)

  if money == nil then error("No 'money' table provided.", 2) end

  local result = (existing_struct == nil and qlua.getMoney.Money() or existing_struct)
  
  result.money_open_limit = value_to_string_or_empty_string(money.money_open_limit)
  result.money_limit_locked_nonmarginal_value = value_to_string_or_empty_string(money.money_limit_locked_nonmarginal_value)
  result.money_limit_locked = value_to_string_or_empty_string(money.money_limit_locked)
  result.money_open_balance = value_to_string_or_empty_string(money.money_open_balance)
  result.money_current_limit = value_to_string_or_empty_string(money.money_current_limit)
  result.money_current_balance = value_to_string_or_empty_string(money.money_current_balance)
  result.money_limit_available = value_to_string_or_empty_string(money.money_limit_available)
  
  return result
end

function StructConverter.getDepo.Depo(depo, existing_struct)
  
  if depo == nil then error("No 'depo' table provided.", 2) end

  local result = (existing_struct == nil and qlua.getDepo.Depo() or existing_struct)
  
  result.depo_limit_locked_buy_value = value_to_string_or_empty_string(depo.depo_limit_locked_buy_value)
  result.depo_current_balance = value_to_string_or_empty_string(depo.depo_current_balance)
  result.depo_limit_locked_buy = value_to_string_or_empty_string(depo.depo_limit_locked_buy)
  result.depo_limit_locked = value_to_string_or_empty_string(depo.depo_limit_locked)
  result.depo_limit_available = value_to_string_or_empty_string(depo.depo_limit_available)
  result.depo_current_limit = value_to_string_or_empty_string(depo.depo_current_limit)
  result.depo_open_balance = value_to_string_or_empty_string(depo.depo_open_balance)
  result.depo_open_limit = value_to_string_or_empty_string(depo.depo_open_limit)
  
  return result
end

function StructConverter.getTradeDate.TradeDate(trade_date, existing_struct)
  
  if trade_date == nil then error("No 'trade_date' table provided.", 2) end

  local result = (existing_struct == nil and qlua.getTradeDate.TradeDate() or existing_struct)
  
  result.date = assert(trade_date.date, "The given 'trade_date' table has no 'date' field.")
  result.year = assert(trade_date.year, "The given 'trade_date' table has no 'year' field.") 
  result.month = assert(trade_date.month, "The given 'trade_date' table has no 'month' field.") 
  result.day = assert(trade_date.day, "The given 'trade_date' table has no 'day' field.") 
  
  return result
end

return StructConverter