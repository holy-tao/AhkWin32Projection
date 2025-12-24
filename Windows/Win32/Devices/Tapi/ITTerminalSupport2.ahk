#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumPluggableSuperclassInfo.ahk
#Include .\IEnumPluggableTerminalClassInfo.ahk
#Include .\ITTerminalSupport.ahk

/**
 * The ITTerminalSupport2 interface is derived from the ITTerminalSupport interface. ITTerminalSupport2 supports the retrieval of information about pluggable terminal classes and superclasses by C, C++, and scripting applications.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itterminalsupport2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTerminalSupport2 extends ITTerminalSupport{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTerminalSupport2
     * @type {Guid}
     */
    static IID => Guid("{f3eb39bc-1b1f-4e99-a0c0-56305c4dd591}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PluggableSuperclasses", "EnumeratePluggableSuperclasses", "get_PluggableTerminalClasses", "EnumeratePluggableTerminalClasses"]

    /**
     * @type {VARIANT} 
     */
    PluggableSuperclasses {
        get => this.get_PluggableSuperclasses()
    }

    /**
     * The get_PluggableSuperclasses method returns a collection of ITPluggableTerminalSuperclassInfo superclass information interface pointers.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo">ITPluggableTerminalSuperclassInfo</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport2-get_pluggablesuperclasses
     */
    get_PluggableSuperclasses() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumeratePluggableSuperclasses method enumerates the pluggable terminal superclasses registered on the current system.
     * @returns {IEnumPluggableSuperclassInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggablesuperclassinfo">IEnumPluggableSuperclassInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport2-enumeratepluggablesuperclasses
     */
    EnumeratePluggableSuperclasses() {
        result := ComCall(14, this, "ptr*", &ppSuperclassEnumerator := 0, "HRESULT")
        return IEnumPluggableSuperclassInfo(ppSuperclassEnumerator)
    }

    /**
     * The get_PluggableTerminalClasses method returns a collection of ITPluggableTerminalClassInfo terminal class information interface pointers.
     * @param {BSTR} bstrTerminalSuperclass The <b>BSTR</b> representation of the CLSID for the terminal superclass.
     * @param {Integer} lMediaType Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal classes.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo">ITPluggableTerminalClassInfo</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport2-get_pluggableterminalclasses
     */
    get_PluggableTerminalClasses(bstrTerminalSuperclass, lMediaType) {
        bstrTerminalSuperclass := bstrTerminalSuperclass is String ? BSTR.Alloc(bstrTerminalSuperclass).Value : bstrTerminalSuperclass

        pVariant := VARIANT()
        result := ComCall(15, this, "ptr", bstrTerminalSuperclass, "int", lMediaType, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumeratePluggableTerminalClasses method enumerates the pluggable terminal classes registered under a given superclass.
     * @param {Guid} iidTerminalSuperclass CLSID for the terminal superclass.
     * @param {Integer} lMediaType Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal classes.
     * @returns {IEnumPluggableTerminalClassInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo">IEnumPluggableTerminalClassInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport2-enumeratepluggableterminalclasses
     */
    EnumeratePluggableTerminalClasses(iidTerminalSuperclass, lMediaType) {
        result := ComCall(16, this, "ptr", iidTerminalSuperclass, "int", lMediaType, "ptr*", &ppClassEnumerator := 0, "HRESULT")
        return IEnumPluggableTerminalClassInfo(ppClassEnumerator)
    }
}
