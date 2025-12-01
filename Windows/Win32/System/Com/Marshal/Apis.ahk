#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\IMarshal.ahk
#Include ..\IUnknown.ahk
#Include ..\IStream.ahk

/**
 * @namespace Windows.Win32.System.Com.Marshal
 * @version v4.0.30319
 */
class Marshal {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Calculates the wire size of the BSTR object, and gets its handle and data. (BSTR_UserSize)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_usersize
     */
    static BSTR_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_usermarshal
     */
    static BSTR_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_userunmarshal
     */
    static BSTR_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files. (BSTR_UserFree)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<BSTR>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_userfree
     */
    static BSTR_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLEAUT32.dll\BSTR_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HWND_UserSize function (oleidl.h) calculates the wire size of the HWND object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_usersize
     */
    static HWND_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HWND_UserMarshal function (oleidl.h) marshals a HWND object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_usermarshal
     */
    static HWND_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HWND_UserUnmarshal function (oleidl.h) unmarshals a HWND object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_userunmarshal
     */
    static HWND_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HWND_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HWND>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_userfree
     */
    static HWND_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HWND_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the BSTR object, and gets its handle and data. (BSTR_UserSize64)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_usersize64
     * @since windows5.1.2600
     */
    static BSTR_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_usermarshal64
     * @since windows5.1.2600
     */
    static BSTR_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_userunmarshal64
     * @since windows5.1.2600
     */
    static BSTR_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\BSTR_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files. (BSTR_UserFree64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<BSTR>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-bstr_userfree64
     * @since windows5.1.2600
     */
    static BSTR_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLEAUT32.dll\BSTR_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HWND_UserSize64 function (oleidl.h) calculates the wire size of the HWND object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_usersize64
     */
    static HWND_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HWND_UserMarshal64 function (oleidl.h) marshals a HWND object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_usermarshal64
     */
    static HWND_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HWND_UserUnmarshal64 function (oleidl.h) unmarshals a HWND object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_userunmarshal64
     */
    static HWND_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HWND_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HWND_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HWND>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hwnd_userfree64
     */
    static HWND_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HWND_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The CLIPFORMAT_UserSize function (oleidl.h) calculates the wire size of the CLIPFORMAT object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_usersize
     */
    static CLIPFORMAT_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserSize", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The CLIPFORMAT_UserMarshal function (oleidl.h) marshals a CLIPFORMAT object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_usermarshal
     */
    static CLIPFORMAT_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserMarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * The CLIPFORMAT_UserUnmarshal function (oleidl.h) unmarshals a CLIPFORMAT object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_userunmarshal
     */
    static CLIPFORMAT_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * The CLIPFORMAT_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_userfree
     */
    static CLIPFORMAT_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ushort*" : "ptr"

        DllCall("OLE32.dll\CLIPFORMAT_UserFree", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * Calculates the wire size of the HBITMAP object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_usersize
     */
    static HBITMAP_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HBITMAP object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_usermarshal
     */
    static HBITMAP_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals an HBITMAP object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_userunmarshal
     */
    static HBITMAP_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HBITMAP>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_userfree
     */
    static HBITMAP_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HBITMAP_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HDC_UserSize function (oleidl.h) calculates the wire size of the HDC object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_usersize
     */
    static HDC_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HDC_UserMarshal function (oleidl.h) marshals a HDC object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_usermarshal
     */
    static HDC_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HDC_UserUnmarshal function (oleidl.h) unmarshals a HDC object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_userunmarshal
     */
    static HDC_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HDC_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HDC>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_userfree
     */
    static HDC_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HDC_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Integer} 
     */
    static HICON_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HICON_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HICON_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HICON>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HICON_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HICON_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Integer} 
     */
    static SNB_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserSize", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Pointer<Integer>} 
     */
    static SNB_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserMarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Pointer<Integer>} 
     */
    static SNB_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static SNB_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        DllCall("ole32.dll\SNB_UserFree", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * The STGMEDIUM_UserSize function (oleidl.h) calculates the wire size of the STGMEDIUM object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_usersize
     */
    static STGMEDIUM_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The STGMEDIUM_UserMarshal function (oleidl.h) marshals a STGMEDIUM object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_usermarshal
     */
    static STGMEDIUM_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The STGMEDIUM_UserUnmarshal function (oleidl.h) unmarshals a STGMEDIUM object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_userunmarshal
     */
    static STGMEDIUM_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The STGMEDIUM_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<STGMEDIUM>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_userfree
     */
    static STGMEDIUM_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\STGMEDIUM_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The CLIPFORMAT_UserSize64 function (oleidl.h) calculates the wire size of the CLIPFORMAT object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_usersize64
     */
    static CLIPFORMAT_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserSize64", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The CLIPFORMAT_UserMarshal64 function (oleidl.h) marshals a CLIPFORMAT object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_usermarshal64
     */
    static CLIPFORMAT_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserMarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * The CLIPFORMAT_UserUnmarshal64 function (oleidl.h) unmarshals a CLIPFORMAT object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_userunmarshal64
     */
    static CLIPFORMAT_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CLIPFORMAT_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * The CLIPFORMAT_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-clipformat_userfree64
     */
    static CLIPFORMAT_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ushort*" : "ptr"

        DllCall("OLE32.dll\CLIPFORMAT_UserFree64", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * Calculates the wire size of the HBITMAP object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_usersize64
     */
    static HBITMAP_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HBITMAP object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_usermarshal64
     */
    static HBITMAP_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals an HBITMAP object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_userunmarshal64
     */
    static HBITMAP_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HBITMAP_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HBITMAP>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-hbitmap_userfree64
     */
    static HBITMAP_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HBITMAP_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HDC_UserSize64 function (oleidl.h) calculates the wire size of the HDC object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_usersize64
     */
    static HDC_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HDC_UserMarshal64 function (oleidl.h) marshals a HDC object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_usermarshal64
     */
    static HDC_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HDC_UserUnmarshal64 function (oleidl.h) unmarshals a HDC object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_userunmarshal64
     */
    static HDC_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HDC_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HDC_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HDC>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hdc_userfree64
     */
    static HDC_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HDC_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Integer} 
     */
    static HICON_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HICON_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HICON_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HICON_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HICON>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HICON_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HICON_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Integer} 
     */
    static SNB_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserSize64", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Pointer<Integer>} 
     */
    static SNB_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserMarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param2 
     * @returns {Pointer<Integer>} 
     */
    static SNB_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\SNB_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Pointer<Pointer<Integer>>>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static SNB_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        DllCall("ole32.dll\SNB_UserFree64", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * The STGMEDIUM_UserSize64 function (oleidl.h) calculates the wire size of the STGMEDIUM object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_usersize64
     */
    static STGMEDIUM_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The STGMEDIUM_UserMarshal64 function (oleidl.h) marshals a STGMEDIUM object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_usermarshal64
     */
    static STGMEDIUM_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The STGMEDIUM_UserUnmarshal64 function (oleidl.h) unmarshals a STGMEDIUM object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_userunmarshal64
     */
    static STGMEDIUM_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\STGMEDIUM_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The STGMEDIUM_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<STGMEDIUM>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-stgmedium_userfree64
     */
    static STGMEDIUM_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\STGMEDIUM_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Returns an upper bound on the number of bytes needed to marshal the specified interface pointer to the specified object.
     * @remarks
     * This function performs the following tasks:
     * 
     * <ol>
     * <li>Queries the object for an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer or, if the object does not implement <b>IMarshal</b>, gets a pointer to COM's standard marshaler.
     * </li>
     * <li>Using the pointer obtained in the preceding item, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-getmarshalsizemax">IMarshal::GetMarshalSizeMax</a>.
     * </li>
     * <li>Adds to the value returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-getmarshalsizemax">GetMarshalSizeMax</a> the size of the marshaling data header and, possibly, that of the proxy CLSID to obtain the maximum size in bytes of the amount of data to be written to the marshaling stream.</li>
     * </ol>
     * You do not explicitly call this function unless you are implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>, in which case your marshaling stub should call this function to get the correct size of the data packet to be marshaled.
     * 
     * 
     * 
     * The value returned by this method is guaranteed to be valid only as long as the internal state of the object being marshaled does not change. Therefore, the actual marshaling should be done immediately after this function returns, or the stub runs the risk that the object, because of some change in state, might require more memory to marshal than it originally indicated.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface whose pointer is to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {IUnknown} pUnk A pointer to the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. Values for <i>dwDestContext</i> come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>.
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags Indicates whether the data to be marshaled is to be transmitted back to the client process the normal case or written to a global table, where it can be retrieved by multiple clients. Values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a>.
     * @returns {Integer} A pointer to the upper-bound value on the size, in bytes, of the data packet to be written to the marshaling stream. If this parameter is 0, the size of the packet is unknown.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetmarshalsizemax
     * @since windows5.0
     */
    static CoGetMarshalSizeMax(riid, pUnk, dwDestContext, pvDestContext, mshlflags) {
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoGetMarshalSizeMax", "uint*", &pulSize := 0, "ptr", riid, "ptr", pUnk, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", mshlflags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulSize
    }

    /**
     * Writes into a stream the data required to initialize a proxy object in some client process.
     * @remarks
     * The <b>CoMarshalInterface</b> function marshals the interface referred to by riid on the object whose <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> implementation is pointed to by <i>pUnk</i>. To do so, the <b>CoMarshalInterface</b> function performs the following tasks:
     * 
     * <ol>
     * <li>
     * Queries the object for a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface. If the object does not implement <b>IMarshal</b>, meaning that it relies on COM to provide marshaling support, <b>CoMarshalInterface</b> gets a pointer to COM's default implementation of <b>IMarshal</b>.
     * 
     * </li>
     * <li>
     * Gets the CLSID of the object's proxy by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-getunmarshalclass">IMarshal::GetUnmarshalClass</a>, using whichever <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface pointer has been returned.
     * 
     * </li>
     * <li>
     * Writes the CLSID of the proxy to the stream to be used for marshaling.
     * 
     * </li>
     * <li>
     * Marshals the interface pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-marshalinterface">IMarshal::MarshalInterface</a>.
     * 
     * </li>
     * </ol>
     * The COM library in the client process calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a> function to extract the data and initialize the proxy. Before calling <b>CoUnmarshalInterface</b>, seek back to the original position in the stream.
     * 
     * If you are implementing existing COM interfaces or defining your own interfaces using the Microsoft Interface Definition Language (MIDL), the MIDL-generated proxies and stubs call <b>CoMarshalInterface</b> for you. If you are writing your own proxies and stubs, your proxy code and stub code should each call <b>CoMarshalInterface</b> to correctly marshal interface pointers. Calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> directly from your proxy and stub code is not recommended.
     * 
     * If you are writing your own implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>, and your proxy needs access to a private object, you can include an interface pointer to that object as part of the data you write to the stream. In such situations, if you want to use COM's default marshaling implementation when passing the interface pointer, you can call <b>CoMarshalInterface</b> on the object to do so.
     * @param {IStream} pStm A pointer to the stream to be used during marshaling. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {IUnknown} pUnk A pointer to the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. The possible values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>. Currently, unmarshaling can occur in another apartment of the current process (MSHCTX_INPROC), in another process on the same computer as the current process (MSHCTX_LOCAL), or in a process on a different computer (MSHCTX_DIFFERENTMACHINE).
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags The flags that specify whether the data to be marshaled is to be transmitted back to the client process (the typical  case) or written to a global table, where it can be retrieved by multiple clients. The possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, the stream-access error values returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>HRESULT</b> was marshaled successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function was not called on the current thread before this function was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-comarshalinterface
     * @since windows5.0
     */
    static CoMarshalInterface(pStm, riid, pUnk, dwDestContext, pvDestContext, mshlflags) {
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoMarshalInterface", "ptr", pStm, "ptr", riid, "ptr", pUnk, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", mshlflags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a newly created proxy using data written into the stream by a previous call to the CoMarshalInterface function, and returns an interface pointer to that proxy.
     * @remarks
     * <div class="alert"><b>Important</b>  <p class="note">Security Note: Calling this method with untrusted data is a security risk. Call this method only with trusted data.
     * 
     * </div>
     * <div> </div>
     * The <b>CoUnmarshalInterface</b> function performs the following tasks:
     * 
     * <ol>
     * <li>Reads from the stream the CLSID to be used to create an instance of the proxy.
     * </li>
     * <li>Gets an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer to the proxy that is to do the unmarshaling. If the object uses COM's default marshaling implementation, the pointer thus obtained is to an instance of the generic proxy object. If the marshaling is occurring between two threads in the same process, the pointer is to an instance of the in-process free threaded marshaler. If the object provides its own marshaling code, <b>CoUnmarshalInterface</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function, passing the CLSID it read from the marshaling stream. <b>CoCreateInstance</b> creates an instance of the object's proxy and returns an <b>IMarshal</b> interface pointer to the proxy.</li>
     * <li>Using whichever IMarshal interface pointer it has acquired, the function then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-unmarshalinterface">IMarshal::UnmarshalInterface</a> and, if appropriate, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-releasemarshaldata">IMarshal::ReleaseMarshalData</a>. 
     * </li>
     * </ol>
     * The primary caller of this function is COM itself, from within interface proxies or stubs that unmarshal an interface pointer. There are, however, some situations in which you might call <b>CoUnmarshalInterface</b>. For example, if you are implementing a stub, your implementation would call <b>CoUnmarshalInterface</b> when the stub receives an interface pointer as a parameter in a method call.
     * @param {IStream} pStm A pointer to the stream from which the interface is to be unmarshaled.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be unmarshaled. For <b>IID_NULL</b>, the returned interface is the one defined by the stream, objref.iid.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppv</i> contains the requested interface pointer for the unmarshaled interface.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-counmarshalinterface
     * @since windows5.0
     */
    static CoUnmarshalInterface(pStm, riid) {
        result := DllCall("OLE32.dll\CoUnmarshalInterface", "ptr", pStm, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Marshals an HRESULT to the specified stream, from which it can be unmarshaled using the CoUnmarshalHresult function.
     * @remarks
     * An <b>HRESULT</b> is process-specific, so an <b>HRESULT</b> that is valid in one process might not be valid in another. If you are writing your own implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> and need to marshal an <b>HRESULT</b> from one process to another, either as a parameter or a return code, you must call this function. In other circumstances, you will have no need to call this function.
     * 
     * This function performs the following tasks:
     * 
     * <ol>
     * <li>Writes an <b>HRESULT</b> to a stream.</li>
     * <li>Returns an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to that stream.</li>
     * </ol>
     * @param {IStream} pstm A pointer to the marshaling stream. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @param {HRESULT} hresult The <b>HRESULT</b> in the originating process.
     * @returns {HRESULT} This function can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>HRESULT</b> was marshaled successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INVALIDPOINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A bad pointer was specified for <i>pstm</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The medium is full.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-comarshalhresult
     * @since windows5.0
     */
    static CoMarshalHresult(pstm, hresult) {
        result := DllCall("OLE32.dll\CoMarshalHresult", "ptr", pstm, "int", hresult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unmarshals an HRESULT type from the specified stream.
     * @remarks
     * You do not explicitly call this function unless you are performing custom marshaling (that is, writing your own implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>), and your implementation needs to unmarshal an <b>HRESULT</b>.
     * 
     * You must use <b>CoUnmarshalHresult</b> to unmarshal <b>HRESULT</b> values previously marshaled by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-comarshalhresult">CoMarshalHresult</a> function.
     * 
     * This function performs the following tasks:
     * 
     * <ol>
     * <li>
     *  an <b>HRESULT</b> from a stream.
     * 
     * </li>
     * <li>Returns the <b>HRESULT</b>.</li>
     * </ol>
     * @param {IStream} pstm A pointer to the stream from which the <b>HRESULT</b> is to be unmarshaled.
     * @returns {HRESULT} A pointer to the unmarshaled <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-counmarshalhresult
     * @since windows5.0
     */
    static CoUnmarshalHresult(pstm) {
        result := DllCall("OLE32.dll\CoUnmarshalHresult", "ptr", pstm, "int*", &phresult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phresult
    }

    /**
     * Destroys a previously marshaled data packet.
     * @remarks
     * <div class="alert"><b>Important</b>  <p class="note">Security Note: Calling this method with untrusted data is a security risk. Call this method only with trusted data.
     * 
     * </div>
     * <div> </div>
     * The <b>CoReleaseMarshalData</b> function performs the following tasks:
     * 
     * <ol>
     * <li>The function reads a CLSID from the stream.</li>
     * <li>If COM's default marshaling implementation is being used, the function gets an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer to an instance of the standard unmarshaler. If custom marshaling is being used, the function creates a proxy by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function, passing the CLSID it read from the stream, and requests an <b>IMarshal</b> interface pointer to the newly created proxy.</li>
     * <li>Using whichever <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface pointer it has acquired, the function calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-releasemarshaldata">IMarshal::ReleaseMarshalData</a>.</li>
     * </ol>
     * You typically do not call this function. The only situation in which you might need to call this function is if you use custom marshaling (write and use your own implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>). Examples of when <b>CoReleaseMarshalData</b> should be called include the following situations: 
     * 
     * <ul>
     * <li>
     * An attempt was made to unmarshal the data packet, but it failed.
     * 
     * </li>
     * <li>
     * A marshaled data packet was removed from a global table.
     * 
     * </li>
     * </ul>
     * As an analogy, the data packet can be thought of as a reference to the original object, just as if it were another interface pointer being held on the object. Like a real interface pointer, that data packet must be released at some point. The use of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-releasemarshaldata">IMarshal::ReleaseMarshalData</a> to release data packets is analogous to the use of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release interface pointers.
     * 
     * Note that you do not need to call <b>CoReleaseMarshalData</b> after a successful call of the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a> function; that function releases the marshal data as part of the processing that it does.
     * 
     * 
     * <div class="alert"><b>Important</b>  You must call  the <b>CoReleaseMarshalData</b> function in the same apartment that called <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-comarshalinterface">CoMarshalInterface</a> to marshal the object into the stream. Failure to do this may cause the object reference held by the marshaled packet in the stream to be leaked.</div>
     * <div> </div>
     * @param {IStream} pStm A  pointer to the stream that contains the data packet to be destroyed. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data packet was successfully destroyed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INVALIDPOINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error related to the <i>pStm</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function was not called on the current thread before this function was called.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coreleasemarshaldata
     * @since windows5.0
     */
    static CoReleaseMarshalData(pStm) {
        result := DllCall("OLE32.dll\CoReleaseMarshalData", "ptr", pStm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a default, or standard, marshaling object in either the client process or the server process, depending on the caller, and returns a pointer to that object's IMarshal implementation.
     * @remarks
     * The <b>CoGetStandardMarshal</b> function creates a default, or standard, marshaling object in either the client process or the server process, as may be necessary, and returns that object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer to the caller. If you implement <b>IMarshal</b>, you may want your implementation to call <b>CoGetStandardMarshal</b> as a way of delegating to COM's default implementation any destination contexts that you do not fully understand or want to handle. Otherwise, you can ignore this function, which COM calls as part of its internal marshaling procedures.
     * 
     * When the COM library in the client process receives a marshaled interface pointer, it looks for a CLSID to be used in creating a proxy for the purposes of unmarshaling the packet. If the packet does not contain a CLSID for the proxy, COM calls <b>CoGetStandardMarshal</b>, passing a <b>NULL</b><i>pUnk</i> value. This function creates a standard proxy in the client process and returns a pointer to that proxy's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>. COM uses this pointer to call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a> to retrieve the pointer to the requested interface.
     * 
     * If your OLE server application's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> calls <b>CoGetStandardMarshal</b>, you should pass both the IID of (<i>riid</i>), and a pointer to (<i>pUnk</i>), the interface being requested.
     * 
     * 
     * 
     * This function performs the following tasks: 
     * 
     * <ol>
     * <li>Determines whether pUnk is <b>NULL</b>.</li>
     * <li>If <i>pUnk</i> is <b>NULL</b>, creates a standard interface proxy in the client process for the specified <i>riid</i> and returns the proxy's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer.
     * </li>
     * <li>If <i>pUnk</i> is not <b>NULL</b>, checks to see if a marshaler for the object already exists, creates a new one if necessary, and returns the marshaler's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> pointer.</li>
     * </ol>
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface whose pointer is to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {IUnknown} pUnk A pointer to the interface to be marshaled.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. Values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>. Unmarshaling can occur either in another apartment of the current process (MSHCTX_INPROC) or in another process on the same computer as the current process (MSHCTX_LOCAL).
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags Indicates whether the data to be marshaled is to be transmitted back to the client process (the normal case) or written to a global table where it can be retrieved by multiple clients. Values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @returns {IMarshal} The address of <b>IMarshal*</b> pointer variable that receives the interface pointer to the standard marshaler.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetstandardmarshal
     * @since windows5.0
     */
    static CoGetStandardMarshal(riid, pUnk, dwDestContext, pvDestContext, mshlflags) {
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoGetStandardMarshal", "ptr", riid, "ptr", pUnk, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", mshlflags, "ptr*", &ppMarshal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMarshal(ppMarshal)
    }

    /**
     * Creates an aggregated standard marshaler for use with lightweight client-side handlers.
     * @remarks
     * The server calls <b>CoGetStdMarshalEx</b> passing in the flag SMEXF_SERVER. This creates a server side standard marshaler (known as a stub manager). The handler calls <b>CoGetStdMarshalEx</b> passing in the flag SMEXF_HANDLER. This creates a client side standard marshaler (known as a proxy manager). Note that when calling this function, the handler must pass the original controlling unknown that was passed to the handler when the handler was created. This will be the system implemented controlling unknown. Failure to pass the correct <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> results in an error returned. On success, the ppUnkInner returned is the controlling unknown of the inner object. The server and handler must keep this pointer, and may use it to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface.
     * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>.
     * @param {Integer} smexflags One of two values indicating whether the aggregated standard marshaler is on the client side or the server side. These flags are defined in the <b>STDMSHLFLAGS</b> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMEXF_SERVER"></a><a id="smexf_server"></a><dl>
     * <dt><b>SMEXF_SERVER</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a server-side aggregated standard marshaler.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMEXF_HANDLER"></a><a id="smexf_handler"></a><dl>
     * <dt><b>SMEXF_HANDLER</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a client-side (handler) aggregated standard marshaler.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IUnknown} On successful return, address of pointer to the <a href="https://docs.microsoft.com/windows/desktop/com/iunknown-and-interface-inheritance">IUnknown</a> interface on the newly-created aggregated standard marshaler. If an error occurs, this value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetstdmarshalex
     * @since windows5.0
     */
    static CoGetStdMarshalEx(pUnkOuter, smexflags) {
        result := DllCall("OLE32.dll\CoGetStdMarshalEx", "ptr", pUnkOuter, "uint", smexflags, "ptr*", &ppUnkInner := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUnkInner)
    }

    /**
     * Marshals an interface pointer from one thread to another thread in the same process.
     * @remarks
     * The <b>CoMarshalInterThreadInterfaceInStream</b> function enables an object to easily and reliably marshal an interface pointer to another thread in the same process. The stream returned in the <i>ppStm</i> parameter is guaranteed to behave correctly when a client running in the receiving thread attempts to unmarshal the pointer. The client can then call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetinterfaceandreleasestream">CoGetInterfaceAndReleaseStream</a> to unmarshal the interface pointer and release the stream object.
     * 
     * The <b>CoMarshalInterThreadInterfaceInStream</b> function performs the following tasks:
     * 
     * <ol>
     * <li>
     * Creates a stream object.
     * 
     * </li>
     * <li>
     * Passes the stream object's IStream pointer to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-comarshalinterface">CoMarshalInterface</a>.
     * 
     * </li>
     * <li>
     * Returns the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the caller.
     * 
     * </li>
     * </ol>
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled.
     * @param {IUnknown} pUnk A pointer to the interface to be marshaled, which must be derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. This parameter can be <b>NULL</b>.
     * @returns {IStream} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>* pointer variable that receives the interface pointer to the stream that contains the marshaled interface.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-comarshalinterthreadinterfaceinstream
     * @since windows5.0
     */
    static CoMarshalInterThreadInterfaceInStream(riid, pUnk) {
        result := DllCall("OLE32.dll\CoMarshalInterThreadInterfaceInStream", "ptr", riid, "ptr", pUnk, "ptr*", &ppStm := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppStm)
    }

    /**
     * Calculates the wire size of the SAFEARRAY object, and gets its handle and data. (LPSAFEARRAY_UserSize)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_usersize
     */
    static LPSAFEARRAY_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserSize", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side. (LPSAFEARRAY_UserMarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppSafeArray</i> parameter is not a valid safe array.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_usermarshal
     */
    static LPSAFEARRAY_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserMarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * Unmarshals a SAFEARRAY object from the RPC buffer. (LPSAFEARRAY_UserUnmarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub has received bad data.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADCALLEE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> object does not have the correct dimensions, does not have the correct features, or memory cannot be reallocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_userunmarshal
     */
    static LPSAFEARRAY_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files. (LPSAFEARRAY_UserFree)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Pointer<SAFEARRAY>>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_userfree
     */
    static LPSAFEARRAY_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        DllCall("OLEAUT32.dll\LPSAFEARRAY_UserFree", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * Calculates the wire size of the SAFEARRAY object, and gets its handle and data. (LPSAFEARRAY_UserSize64)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_usersize64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserSize64", param0Marshal, param0, "uint", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side. (LPSAFEARRAY_UserMarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppSafeArray</i> parameter is not a valid safe array.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_usermarshal64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserMarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * Unmarshals a SAFEARRAY object from the RPC buffer. (LPSAFEARRAY_UserUnmarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Pointer<SAFEARRAY>>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub has received bad data.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADCALLEE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> object does not have the correct dimensions, does not have the correct features, or memory cannot be reallocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_userunmarshal64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files. (LPSAFEARRAY_UserFree64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Pointer<SAFEARRAY>>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-lpsafearray_userfree64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        DllCall("OLEAUT32.dll\LPSAFEARRAY_UserFree64", param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * The HACCEL_UserSize function (oleidl.h) calculates the wire size of the HACCEL object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_usersize
     */
    static HACCEL_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a HACCEL into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_usermarshal
     */
    static HACCEL_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HACCEL_UserUnmarshal function (oleidl.h) unmarshals a HACCEL object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_userunmarshal
     */
    static HACCEL_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HACCEL_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HACCEL>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_userfree
     */
    static HACCEL_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HACCEL_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HGLOBAL_UserSize function (oleidl.h) calculates the wire size of the HGLOBAL object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_usersize
     */
    static HGLOBAL_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a HGLOBAL into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_usermarshal
     */
    static HGLOBAL_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HGLOBAL_UserUnmarshal function (oleidl.h) unmarshals a HGLOBAL object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_userunmarshal
     */
    static HGLOBAL_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HGLOBAL_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HGLOBAL>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_userfree
     */
    static HGLOBAL_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HGLOBAL_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Integer} 
     */
    static HMENU_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HMENU_UserMarshal function (oleidl.h) marshals a HMENU into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_usermarshal
     */
    static HMENU_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HMENU_UserUnmarshal function (oleidl.h) unmarshals a HMENU object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_userunmarshal
     */
    static HMENU_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HMENU_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HMENU>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_userfree
     */
    static HMENU_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HMENU_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HACCEL_UserSize64 function (oaild.h) calculates the wire size of the HACCEL object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_usersize64
     */
    static HACCEL_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a HACCEL object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_usermarshal64
     */
    static HACCEL_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HACCEL_UserUnmarshal64 function (oleidl.h) unmarshals a HACCEL object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_userunmarshal64
     */
    static HACCEL_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HACCEL_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HACCEL_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HACCEL>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-haccel_userfree64
     */
    static HACCEL_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HACCEL_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HGLOBAL_UserSize64 function (oleidl.h) calculates the wire size of the HGLOBAL object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_usersize64
     */
    static HGLOBAL_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a HGLOBAL object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_usermarshal64
     */
    static HGLOBAL_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HGLOBAL_UserUnmarshal64 function (oleidl.h) unmarshals a HGLOBAL object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_userunmarshal64
     */
    static HGLOBAL_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HGLOBAL_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HGLOBAL_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HGLOBAL>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hglobal_userfree64
     */
    static HGLOBAL_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HGLOBAL_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * The HMENU_UserSize64 function (oleidl.h) calculates the wire size of the HMENU object and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_usersize64
     */
    static HMENU_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HMENU_UserMarshal64 function (oleidl.h) marshals a HMENU into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_usermarshal64
     */
    static HMENU_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HMENU_UserUnmarshal64 function (oleidl.h) unmarshals a HMENU object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_userunmarshal64
     */
    static HMENU_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HMENU_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HMENU_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HMENU>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-hmenu_userfree64
     */
    static HMENU_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HMENU_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the HPALETTE object and gets its handle and data. (HPALETTE_UserSize)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Integer} A LONG value expressing the size of the object.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_usersize
     */
    static HPALETTE_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HPALETTE object into the RPC buffer. (HPALETTE_UserMarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Integer>} A pointer to an unsigned character array.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_usermarshal
     */
    static HPALETTE_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals an HPALETTE object from the RPC buffer. (HPALETTE_UserUnmarshal)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Integer>} A pointer to an unsigned character array.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_userunmarshal
     */
    static HPALETTE_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files (HPALETTE_UserFree).
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HPALETTE>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_userfree
     */
    static HPALETTE_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HPALETTE_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the HPALETTE object and gets its handle and data. (HPALETTE_UserSize64)
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Integer} A LONG value expressing the size of the object.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_usersize64
     */
    static HPALETTE_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HPALETTE object into the RPC buffer. (HPALETTE_UserMarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Integer>} A pointer to an unsigned character array.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_usermarshal64
     */
    static HPALETTE_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals an HPALETTE object from the RPC buffer. (HPALETTE_UserUnmarshal64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Integer>} A pointer to an unsigned character array.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_userunmarshal64
     */
    static HPALETTE_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HPALETTE_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files. (HPALETTE_UserFree64)
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HPALETTE>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-hpalette_userfree64
     */
    static HPALETTE_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HPALETTE_UserFree64", param0Marshal, param0, "ptr", param1)
    }

;@endregion Methods
}
