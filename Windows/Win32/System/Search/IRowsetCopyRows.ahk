#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetCopyRows extends IUnknown{
    /**
     * The interface identifier for IRowsetCopyRows
     * @type {Guid}
     */
    static IID => Guid("{0c733a6b-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} hSourceID 
     * @returns {HRESULT} 
     */
    CloseSource(hSourceID) {
        result := ComCall(3, this, "ushort", hSourceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hSourceID 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Integer} bFlags 
     * @returns {HRESULT} 
     */
    CopyByHROWS(hSourceID, hReserved, cRows, rghRows, bFlags) {
        result := ComCall(4, this, "ushort", hSourceID, "ptr", hReserved, "ptr", cRows, "ptr*", rghRows, "uint", bFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hSourceID 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Integer} bFlags 
     * @param {Pointer<UIntPtr>} pcRowsCopied 
     * @returns {HRESULT} 
     */
    CopyRows(hSourceID, hReserved, cRows, bFlags, pcRowsCopied) {
        result := ComCall(5, this, "ushort", hSourceID, "ptr", hReserved, "ptr", cRows, "uint", bFlags, "ptr*", pcRowsCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRowset>} pRowsetSource 
     * @param {Pointer} cColIds 
     * @param {Pointer<IntPtr>} rgSourceColumns 
     * @param {Pointer<IntPtr>} rgTargetColumns 
     * @param {Pointer<UInt16>} phSourceID 
     * @returns {HRESULT} 
     */
    DefineSource(pRowsetSource, cColIds, rgSourceColumns, rgTargetColumns, phSourceID) {
        result := ComCall(6, this, "ptr", pRowsetSource, "ptr", cColIds, "ptr*", rgSourceColumns, "ptr*", rgTargetColumns, "ushort*", phSourceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
