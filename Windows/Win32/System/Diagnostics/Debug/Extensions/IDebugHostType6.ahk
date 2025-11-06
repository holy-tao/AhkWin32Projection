#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostTaggedUnionRangeEnumerator.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostType5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType6 extends IDebugHostType5{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTaggedUnionTag", "GetTaggedUnionTagRanges", "UpcastToTaggedUnionType"]

    /**
     * 
     * @param {Pointer<IDebugHostType>} pTagType 
     * @param {Pointer<Integer>} pTagOffset 
     * @param {Pointer<VARIANT>} pTagMask 
     * @returns {HRESULT} 
     */
    GetTaggedUnionTag(pTagType, pTagOffset, pTagMask) {
        pTagOffsetMarshal := pTagOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "ptr*", pTagType, pTagOffsetMarshal, pTagOffset, "ptr", pTagMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostTaggedUnionRangeEnumerator} 
     */
    GetTaggedUnionTagRanges() {
        result := ComCall(40, this, "ptr*", &pTagRangeEnumerator := 0, "HRESULT")
        return IDebugHostTaggedUnionRangeEnumerator(pTagRangeEnumerator)
    }

    /**
     * 
     * @param {IDebugHostType} pTaggedUnionType 
     * @returns {IDebugHostType} 
     */
    UpcastToTaggedUnionType(pTaggedUnionType) {
        result := ComCall(41, this, "ptr", pTaggedUnionType, "ptr*", &pUpcastedCaseType := 0, "HRESULT")
        return IDebugHostType(pUpcastedCaseType)
    }
}
