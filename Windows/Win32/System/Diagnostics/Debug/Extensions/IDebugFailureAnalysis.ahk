#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugFailureAnalysis extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugFailureAnalysis
     * @type {Guid}
     */
    static IID => Guid("{ed0de363-451f-4943-820c-62dccdfa7e6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFailureClass", "GetFailureType", "GetFailureCode", "Get", "GetNext", "GetString", "GetBuffer", "GetUlong", "GetUlong64", "NextEntry"]

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureClass() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureType() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureCode() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Get Mutual Kerberos Authentication
     * @param {Integer} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-odbc-how-to/get-mutual-kerberos-authentication
     */
    Get(Tag) {
        result := ComCall(6, this, "int", Tag, "ptr")
        return result
    }

    /**
     * Retrieves a handle to the first control in a group of controls that precedes (or follows) the specified control in a dialog box.
     * @remarks
     * The <b>GetNextDlgGroupItem</b> function searches controls in the order (or reverse order) they were created in the dialog box template. The first control in the group must have the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dlgbox-programming-considerations">WS_GROUP</a> style; all other controls in the group must have been consecutively created and must not have the <b>WS_GROUP</b> style. 
     * 
     * When searching for the previous control, the function returns the first control it locates that is visible and not disabled. If the control specified by <i>hCtl</i> has the <b>WS_GROUP</b> style, the function temporarily reverses the search to locate the first control having the <b>WS_GROUP</b> style, then resumes the search in the original direction, returning the first control it locates that is visible and not disabled, or returning <i>hCtl</i> if no such control is found. 
     * 
     * When searching for the next control, the function returns the first control it locates that is visible, not disabled, and does not have the <b>WS_GROUP</b> style. If it encounters a control having the <b>WS_GROUP</b> style, the function reverses the search, locates the first control having the <b>WS_GROUP</b> style, and returns this control if it is visible and not disabled. Otherwise, the function resumes the search in the original direction and returns the first control it locates that is visible and not disabled, or returns <i>hCtl</i> if no such control is found. 
     * 
     * If the search for the next control in the group encounters a window with the <b>WS_EX_CONTROLPARENT</b> style, the system recursively searches the window's children.
     * @param {Pointer<FA_ENTRY>} Entry 
     * @param {Integer} Tag 
     * @param {Integer} TagMask 
     * @returns {Pointer<FA_ENTRY>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous (or next) control in the group of controls. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getnextdlggroupitem
     */
    GetNext(Entry, Tag, TagMask) {
        result := ComCall(7, this, "ptr", Entry, "int", Tag, "int", TagMask, "ptr")
        return result
    }

    /**
     * GetString Method Example (VC++)
     * @param {Integer} Tag 
     * @param {Pointer} Str 
     * @param {Integer} MaxSize 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getstring-method-example-vc
     */
    GetString(Tag, Str, MaxSize) {
        result := ComCall(8, this, "int", Tag, "ptr", Str, "uint", MaxSize, "ptr")
        return result
    }

    /**
     * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
     * @remarks
     * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
     * @param {Integer} Tag 
     * @param {Pointer} Buf 
     * @param {Integer} Size_ 
     * @returns {Pointer<FA_ENTRY>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If an error occurs, <i>ppbBuffer</i>  is set to <b>NULL</b> and <i>pcxRow</i> is set to zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/uxtheme/nf-uxtheme-getbufferedpaintbits
     */
    GetBuffer(Tag, Buf, Size_) {
        result := ComCall(9, this, "int", Tag, "ptr", Buf, "uint", Size_, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "int", Tag, ValueMarshal, Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong64(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", Tag, ValueMarshal, Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @returns {Pointer<FA_ENTRY>} 
     */
    NextEntry(Entry) {
        result := ComCall(12, this, "ptr", Entry, "ptr")
        return result
    }
}
