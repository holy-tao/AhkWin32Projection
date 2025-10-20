#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostBaseClass.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostBaseClass2 extends IDebugHostBaseClass{
    /**
     * The interface identifier for IDebugHostBaseClass2
     * @type {Guid}
     */
    static IID => Guid("{435460e2-fd3b-4275-b36c-88ef50188588}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Boolean>} pIsVirtual 
     * @returns {HRESULT} 
     */
    IsVirtual(pIsVirtual) {
        result := ComCall(11, this, "int*", pIsVirtual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTableOffset 
     * @param {Pointer<Int64>} pSlotOffset 
     * @param {Pointer<UInt64>} pSlotSize 
     * @param {Pointer<Boolean>} pSlotIsSigned 
     * @returns {HRESULT} 
     */
    GetVirtualBaseOffsetLocation(pTableOffset, pSlotOffset, pSlotSize, pSlotIsSigned) {
        result := ComCall(12, this, "int64*", pTableOffset, "int64*", pSlotOffset, "uint*", pSlotSize, "int*", pSlotIsSigned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
