#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * A replacement for IPersistStream that adds an initialization method.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipersiststreaminit
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistStreamInit extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistStreamInit
     * @type {Guid}
     */
    static IID => Guid("{7fd52380-4e07-101b-ae2d-08002b2ec713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "GetSizeMax", "InitNew"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {IStream} pStm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-load
     */
    Load(pStm) {
        result := ComCall(5, this, "ptr", pStm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStm 
     * @param {BOOL} fClearDirty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-save
     */
    Save(pStm, fClearDirty) {
        result := ComCall(6, this, "ptr", pStm, "int", fClearDirty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCbSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-getsizemax
     */
    GetSizeMax(pCbSize) {
        result := ComCall(7, this, "uint*", pCbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-initnew
     */
    InitNew() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
