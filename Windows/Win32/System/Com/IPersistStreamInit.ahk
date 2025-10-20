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
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStm 
     * @returns {HRESULT} 
     */
    Load(pStm) {
        result := ComCall(5, this, "ptr", pStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStm 
     * @param {BOOL} fClearDirty 
     * @returns {HRESULT} 
     */
    Save(pStm, fClearDirty) {
        result := ComCall(6, this, "ptr", pStm, "int", fClearDirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pCbSize 
     * @returns {HRESULT} 
     */
    GetSizeMax(pCbSize) {
        result := ComCall(7, this, "uint*", pCbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
