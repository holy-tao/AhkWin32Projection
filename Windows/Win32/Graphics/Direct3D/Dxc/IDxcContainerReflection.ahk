#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcContainerReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcContainerReflection
     * @type {Guid}
     */
    static IID => Guid("{d2c21b26-8350-4bdc-976a-331ce6f4c54c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Load", "GetPartCount", "GetPartKind", "GetPartContent", "FindFirstPartKind", "GetPartReflection"]

    /**
     * 
     * @param {IDxcBlob} pContainer 
     * @returns {HRESULT} 
     */
    Load(pContainer) {
        result := ComCall(3, this, "ptr", pContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    GetPartCount(pResult) {
        result := ComCall(4, this, "uint*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idx 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    GetPartKind(idx, pResult) {
        result := ComCall(5, this, "uint", idx, "uint*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idx 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetPartContent(idx, ppResult) {
        result := ComCall(6, this, "uint", idx, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    FindFirstPartKind(kind, pResult) {
        result := ComCall(7, this, "uint", kind, "uint*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idx 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetPartReflection(idx, iid, ppvObject) {
        result := ComCall(8, this, "uint", idx, "ptr", iid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
