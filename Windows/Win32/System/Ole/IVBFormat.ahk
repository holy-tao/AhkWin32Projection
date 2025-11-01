#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides formatting support for controls on a Visual Basic container.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-ivbformat
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IVBFormat extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBFormat
     * @type {Guid}
     */
    static IID => Guid("{9849fd60-3768-101b-8d72-ae6164ffe3cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Format"]

    /**
     * 
     * @param {Pointer<VARIANT>} vData 
     * @param {BSTR} bstrFormat 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cb 
     * @param {Integer} lcid 
     * @param {Integer} sFirstDayOfWeek 
     * @param {Integer} sFirstWeekOfYear 
     * @param {Pointer<Integer>} rcb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nf-vbinterf-ivbformat-format
     */
    Format(vData, bstrFormat, lpBuffer, cb, lcid, sFirstDayOfWeek, sFirstWeekOfYear, rcb) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        rcbMarshal := rcb is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", vData, "ptr", bstrFormat, lpBufferMarshal, lpBuffer, "ushort", cb, "int", lcid, "short", sFirstDayOfWeek, "ushort", sFirstWeekOfYear, rcbMarshal, rcb, "HRESULT")
        return result
    }
}
