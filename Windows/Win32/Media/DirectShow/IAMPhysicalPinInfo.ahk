#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamphysicalpininfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPhysicalPinInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMPhysicalPinInfo
     * @type {Guid}
     */
    static IID => Guid("{f938c991-3029-11cf-8c44-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPhysicalType"]

    /**
     * Note  The IAMPhysicalPinInfo interface is deprecated. Retrieves the type and name of the physical pin.
     * @param {Pointer<Integer>} pType Pointer to a variable that receives a value indicating the pin's type. The [PhysicalConnectorType](/windows/desktop/api/strmif/ne-strmif-physicalconnectortype) enumeration defines the pin type values.
     * @param {Pointer<PWSTR>} ppszType Address of a pointer to a buffer that receives a human-readable string identifying the pin type.
     * @returns {HRESULT} Returns S_OK if a valid physical pin value is found. Otherwise, returns VFW_E_NO_ACCEPTABLE_TYPES.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamphysicalpininfo-getphysicaltype
     */
    GetPhysicalType(pType, ppszType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        ppszTypeMarshal := ppszType is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pTypeMarshal, pType, ppszTypeMarshal, ppszType, "HRESULT")
        return result
    }
}
