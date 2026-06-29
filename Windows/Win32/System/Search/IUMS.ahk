#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IUMS extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUMS interfaces
    */
    struct Vtbl {
        SqlUmsSuspend            : IntPtr
        SqlUmsYield              : IntPtr
        SqlUmsSwitchPremptive    : IntPtr
        SqlUmsSwitchNonPremptive : IntPtr
        SqlUmsFIsPremptive       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUMS.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ticks 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSuspend(ticks) {
        ComCall(0, this, "uint", ticks)
    }

    /**
     * 
     * @param {Integer} ticks 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsYield(ticks) {
        ComCall(1, this, "uint", ticks)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSwitchPremptive() {
        ComCall(2, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSwitchNonPremptive() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    SqlUmsFIsPremptive() {
        result := ComCall(4, this, BOOL)
        return result
    }

    Query(iid) {
        if (IUMS.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
