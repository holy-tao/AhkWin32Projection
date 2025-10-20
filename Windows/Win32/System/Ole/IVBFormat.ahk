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
     * 
     * @param {Pointer<VARIANT>} vData 
     * @param {BSTR} bstrFormat 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cb 
     * @param {Integer} lcid 
     * @param {Integer} sFirstDayOfWeek 
     * @param {Integer} sFirstWeekOfYear 
     * @param {Pointer<UInt16>} rcb 
     * @returns {HRESULT} 
     */
    Format(vData, bstrFormat, lpBuffer, cb, lcid, sFirstDayOfWeek, sFirstWeekOfYear, rcb) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        result := ComCall(3, this, "ptr", vData, "ptr", bstrFormat, "ptr", lpBuffer, "ushort", cb, "int", lcid, "short", sFirstDayOfWeek, "ushort", sFirstWeekOfYear, "ushort*", rcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
