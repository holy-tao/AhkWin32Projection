#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType6 extends IDebugHostType5{
    /**
     * The interface identifier for IDebugHostType6
     * @type {Guid}
     */
    static IID => Guid("{08b431ed-f684-4480-8c44-b543aa32ceb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * 
     * @param {Pointer<IDebugHostType>} pTagType 
     * @param {Pointer<UInt32>} pTagOffset 
     * @param {Pointer<VARIANT>} pTagMask 
     * @returns {HRESULT} 
     */
    GetTaggedUnionTag(pTagType, pTagOffset, pTagMask) {
        result := ComCall(39, this, "ptr", pTagType, "uint*", pTagOffset, "ptr", pTagMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostTaggedUnionRangeEnumerator>} pTagRangeEnumerator 
     * @returns {HRESULT} 
     */
    GetTaggedUnionTagRanges(pTagRangeEnumerator) {
        result := ComCall(40, this, "ptr", pTagRangeEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} pTaggedUnionType 
     * @param {Pointer<IDebugHostType>} pUpcastedCaseType 
     * @returns {HRESULT} 
     */
    UpcastToTaggedUnionType(pTaggedUnionType, pUpcastedCaseType) {
        result := ComCall(41, this, "ptr", pTaggedUnionType, "ptr", pUpcastedCaseType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
