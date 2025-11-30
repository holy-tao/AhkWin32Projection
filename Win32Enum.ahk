#Requires AutoHotkey v2.0

#Include Win32Struct.ahk

/**
 * Win32Enum is the base class from which all enum types derive, and provides
 * utility methods for them.
 */
class Win32Enum {

    /**
     * Given an enum value, returns the value's name. This enumerates potetially all of the enum's values,
     * so can be slow; it is intended primarilly for debugging. This is a shorthand for `ToString`; the
     * following statements are identical:
     * 
     *      val := MY_ENUM[42]
     *      val := MY_ENUM.ToString(42)
     */
    static __Item[enumValue] {
        get => this.ToString(enumValue)
    }

    /**
     * Get the name of an enum value. This enumerates potetially all of the enum's values,
     * so can be slow; it is intended primarilly for debugging.
     * 
     * @param {Integer} enumValue the value to ge the name of
     * @returns {String} the name of the enum value
     */
    static ToString(enumValue){
        if(!IsInteger(enumValue)){
            throw TypeError("Expected an Integer but got a(n) " . type(enumValue), , enumValue)
        }

        for(name, val in this.OwnProps()){
            if(val == enumValue){
                return name
            }
        }

        throw ValueError("Value not in enum " . this.__Class, , enumValue)
    }
}

/**
 * Win32BitflagEnum is the base class from which all bitflag enum classes derive, 
 * and provides utility methods for them.
 */
class Win32BitflagEnum extends Win32Enum {

    /**
     * Converts an enum value into a string in the format `VALUE1 | VALUE2 | VALUE3 | ...`. This
     * enumerates all of the enum's values, so can be slow; it is intended primarilly for
     * debugging
     * 
     * @param {Integer} enumValue the enum value to convert
     * @returns {String} a string representation of the enumeration
     */
    static ToString(enumValue){
        if(!IsInteger(enumValue)){
            throw TypeError("Expected an Integer but got a(n) " . type(enumValue), , enumValue)
        }

        flags := []

        for(name, val in this.OwnProps()){
            if(!IsInteger(val)){
                continue    ; Prototype, __Class, etc
            }

            if(this.HasFlag(enumValue, val)){
                flags.Push(name)
            }
        }

        outStr := ""
        for(flag in flags){
            outStr .= flag
            if(A_Index < flags.Length){
                outStr .= " | "
            }
        }

        return outStr
    }

    /**
     * Determines whether or not `enumValue` has `flag`
     * 
     * @param {Integer} enumValue enum value to check
     * @param {Integer} flag flag to check
     * @returns {Boolean} a truthy value if `enumValue` has `flag`, a falsy value otherwise
     */
    static HasFlag(enumValue, flag){
        return enumValue & flag == flag
    }

    /**
     * Determines whether or not `enumValue` has all of the flags in `flags`
     * 
     * @param {Integer} enumValue enum value to check
     * @param {Array<Integer>} flags variadic array of flags to check
     * @returns {Boolean} a truthy value if `enumValue` has all `flags`, a falsy value
     *          if it is missing any of them.
     */
    static HasFlags(enumValue, flags*){
        if(!IsInteger(enumValue)){
            throw TypeError("Expected an Integer but got a(n) " . type(enumValue), , enumValue)
        }

        combined := 0
        for(flag in flags){
            combined |= Integer(flag)
        }

        return enumValue & combined == combined
    }
}