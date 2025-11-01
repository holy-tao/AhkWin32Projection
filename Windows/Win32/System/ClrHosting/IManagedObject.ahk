#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IManagedObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManagedObject
     * @type {Guid}
     */
    static IID => Guid("{c3fcc19e-a970-11d2-8b5a-00a0c9b7c9c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedBuffer", "GetObjectIdentity"]

    /**
     * 
     * @param {Pointer<BSTR>} pBSTR 
     * @returns {HRESULT} 
     */
    GetSerializedBuffer(pBSTR) {
        result := ComCall(3, this, "ptr", pBSTR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBSTRGUID 
     * @param {Pointer<Integer>} AppDomainID 
     * @param {Pointer<Integer>} pCCW 
     * @returns {HRESULT} 
     */
    GetObjectIdentity(pBSTRGUID, AppDomainID, pCCW) {
        result := ComCall(4, this, "ptr", pBSTRGUID, "int*", AppDomainID, "int*", pCCW, "HRESULT")
        return result
    }
}
