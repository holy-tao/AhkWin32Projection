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
     * 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<PWSTR>} ppszType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamphysicalpininfo-getphysicaltype
     */
    GetPhysicalType(pType, ppszType) {
        result := ComCall(3, this, "int*", pType, "ptr", ppszType, "HRESULT")
        return result
    }
}
