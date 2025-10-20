#Requires AutoHotkey v2.0

/**
 * Win32ComInterface is the base class from which all generated COM Interfaces
 * derive. 
 * 
 * @see https://www.autohotkey.com/docs/v2/lib/ComValue.htm
 */
class Win32ComInterface {

    /**
     * Pointer to the beginning of this interface's function table
     * @type {ComValue}
     */
    ptr := unset

    /**
     * Initializes a new `Win32ComInterface` object
     * @param {Integer} ptr the interface pointer to wrap
     */
    __New(ptr){
        this.ptr := ptr
    }
}