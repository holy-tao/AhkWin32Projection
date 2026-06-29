#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITTerminalSupport.ahk" { ITTerminalSupport }
#Import ".\IEnumPluggableSuperclassInfo.ahk" { IEnumPluggableSuperclassInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IEnumPluggableTerminalClassInfo.ahk" { IEnumPluggableTerminalClassInfo }

/**
 * The ITTerminalSupport2 interface is derived from the ITTerminalSupport interface. ITTerminalSupport2 supports the retrieval of information about pluggable terminal classes and superclasses by C, C++, and scripting applications.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itterminalsupport2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTerminalSupport2 extends ITTerminalSupport {
    /**
     * The interface identifier for ITTerminalSupport2
     * @type {Guid}
     */
    static IID := Guid("{f3eb39bc-1b1f-4e99-a0c0-56305c4dd591}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTerminalSupport2 interfaces
    */
    struct Vtbl extends ITTerminalSupport.Vtbl {
        get_PluggableSuperclasses         : IntPtr
        EnumeratePluggableSuperclasses    : IntPtr
        get_PluggableTerminalClasses      : IntPtr
        EnumeratePluggableTerminalClasses : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTerminalSupport2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    PluggableSuperclasses {
        get => this.get_PluggableSuperclasses()
    }

    /**
     * The get_PluggableSuperclasses method returns a collection of ITPluggableTerminalSuperclassInfo superclass information interface pointers.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo">ITPluggableTerminalSuperclassInfo</a> interface returned by <b>ITTerminalSupport2::get_PluggableSuperclasses</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo">ITPluggableTerminalSuperclassInfo</a> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo">ITPluggableTerminalSuperclassInfo</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport2-get_pluggablesuperclasses
     */
    get_PluggableSuperclasses() {
        pVariant := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumeratePluggableSuperclasses method enumerates the pluggable terminal superclasses registered on the current system.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggablesuperclassinfo">IEnumPluggableSuperclassInfo</a> interface returned by <b>ITTerminalSupport2::EnumeratePluggableSuperclasses</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumPluggableSuperclassInfo</b> interface to free resources associated with it.
     * @returns {IEnumPluggableSuperclassInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggablesuperclassinfo">IEnumPluggableSuperclassInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport2-enumeratepluggablesuperclasses
     */
    EnumeratePluggableSuperclasses() {
        result := ComCall(14, this, "ptr*", &ppSuperclassEnumerator := 0, "HRESULT")
        return IEnumPluggableSuperclassInfo(ppSuperclassEnumerator)
    }

    /**
     * The get_PluggableTerminalClasses method returns a collection of ITPluggableTerminalClassInfo terminal class information interface pointers.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo">ITPluggableTerminalClassInfo</a> interface returned by <b>ITTerminalSupport2::get_PluggableTerminalClasses</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITPluggableTerminalClassInfo</b> interface to free resources associated with it.
     * @param {BSTR} bstrTerminalSuperclass The <b>BSTR</b> representation of the CLSID for the terminal superclass.
     * @param {Integer} lMediaType Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal classes.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo">ITPluggableTerminalClassInfo</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport2-get_pluggableterminalclasses
     */
    get_PluggableTerminalClasses(bstrTerminalSuperclass, lMediaType) {
        bstrTerminalSuperclass := bstrTerminalSuperclass is String ? BSTR.Alloc(bstrTerminalSuperclass).Value : bstrTerminalSuperclass

        pVariant := VARIANT()
        result := ComCall(15, this, BSTR, bstrTerminalSuperclass, "int", lMediaType, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumeratePluggableTerminalClasses method enumerates the pluggable terminal classes registered under a given superclass.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo">IEnumPluggableTerminalClassInfo</a> interface returned by <b>ITTerminalSupport2::EnumeratePluggableTerminalClasses</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumPluggableTerminalClassInfo</b> interface to free resources associated with it.
     * @param {Guid} iidTerminalSuperclass CLSID for the terminal superclass.
     * @param {Integer} lMediaType Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal classes.
     * @returns {IEnumPluggableTerminalClassInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo">IEnumPluggableTerminalClassInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport2-enumeratepluggableterminalclasses
     */
    EnumeratePluggableTerminalClasses(iidTerminalSuperclass, lMediaType) {
        result := ComCall(16, this, Guid, iidTerminalSuperclass, "int", lMediaType, "ptr*", &ppClassEnumerator := 0, "HRESULT")
        return IEnumPluggableTerminalClassInfo(ppClassEnumerator)
    }

    Query(iid) {
        if (ITTerminalSupport2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PluggableSuperclasses := CallbackCreate(GetMethod(implObj, "get_PluggableSuperclasses"), flags, 2)
        this.vtbl.EnumeratePluggableSuperclasses := CallbackCreate(GetMethod(implObj, "EnumeratePluggableSuperclasses"), flags, 2)
        this.vtbl.get_PluggableTerminalClasses := CallbackCreate(GetMethod(implObj, "get_PluggableTerminalClasses"), flags, 4)
        this.vtbl.EnumeratePluggableTerminalClasses := CallbackCreate(GetMethod(implObj, "EnumeratePluggableTerminalClasses"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PluggableSuperclasses)
        CallbackFree(this.vtbl.EnumeratePluggableSuperclasses)
        CallbackFree(this.vtbl.get_PluggableTerminalClasses)
        CallbackFree(this.vtbl.EnumeratePluggableTerminalClasses)
    }
}
