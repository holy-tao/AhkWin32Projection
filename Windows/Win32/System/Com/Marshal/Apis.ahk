#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.Com.Marshal
 * @version v4.0.30319
 */
class Marshal {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Calculates the wire size of the BSTR object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_usersize
     */
    static BSTR_UserSize(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a BSTR object into the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_usermarshal
     */
    static BSTR_UserMarshal(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals a BSTR object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_userunmarshal
     */
    static BSTR_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<BSTR>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_userfree
     */
    static BSTR_UserFree(param0, param1) {
        DllCall("OLEAUT32.dll\BSTR_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Integer} 
     */
    static HWND_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HWND_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HWND_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HWND>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HWND_UserFree(param0, param1) {
        DllCall("OLE32.dll\HWND_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the BSTR object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_usersize64
     * @since windows5.1.2600
     */
    static BSTR_UserSize64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a BSTR object into the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_usermarshal64
     * @since windows5.1.2600
     */
    static BSTR_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals a BSTR object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<BSTR>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_userunmarshal64
     * @since windows5.1.2600
     */
    static BSTR_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\BSTR_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<BSTR>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-bstr_userfree64
     * @since windows5.1.2600
     */
    static BSTR_UserFree64(param0, param1) {
        DllCall("OLEAUT32.dll\BSTR_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Integer} 
     */
    static HWND_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HWND_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HWND>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HWND_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HWND_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HWND>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HWND_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HWND_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Integer} 
     */
    static CLIPFORMAT_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserSize", "uint*", param0, "uint", param1, "ushort*", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static CLIPFORMAT_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserMarshal", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static CLIPFORMAT_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserUnmarshal", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<UInt16>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static CLIPFORMAT_UserFree(param0, param1) {
        DllCall("OLE32.dll\CLIPFORMAT_UserFree", "uint*", param0, "ushort*", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Integer} 
     */
    static HBITMAP_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HBITMAP_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HBITMAP_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HBITMAP>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HBITMAP_UserFree(param0, param1) {
        DllCall("OLE32.dll\HBITMAP_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Integer} 
     */
    static HDC_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HDC_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HDC_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HDC>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HDC_UserFree(param0, param1) {
        DllCall("OLE32.dll\HDC_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Integer} 
     */
    static HICON_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HICON_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HICON_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HICON>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HICON_UserFree(param0, param1) {
        DllCall("OLE32.dll\HICON_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Integer} 
     */
    static SNB_UserSize(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserSize", "uint*", param0, "uint", param1, "ushort*", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static SNB_UserMarshal(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserMarshal", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static SNB_UserUnmarshal(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserUnmarshal", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<UInt16>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static SNB_UserFree(param0, param1) {
        DllCall("ole32.dll\SNB_UserFree", "uint*", param0, "ushort*", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Integer} 
     */
    static STGMEDIUM_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Byte>} 
     */
    static STGMEDIUM_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Byte>} 
     */
    static STGMEDIUM_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<STGMEDIUM>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static STGMEDIUM_UserFree(param0, param1) {
        DllCall("OLE32.dll\STGMEDIUM_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Integer} 
     */
    static CLIPFORMAT_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserSize64", "uint*", param0, "uint", param1, "ushort*", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static CLIPFORMAT_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserMarshal64", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static CLIPFORMAT_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\CLIPFORMAT_UserUnmarshal64", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<UInt16>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static CLIPFORMAT_UserFree64(param0, param1) {
        DllCall("OLE32.dll\CLIPFORMAT_UserFree64", "uint*", param0, "ushort*", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Integer} 
     */
    static HBITMAP_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HBITMAP_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HBITMAP>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HBITMAP_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HBITMAP_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HBITMAP>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HBITMAP_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HBITMAP_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Integer} 
     */
    static HDC_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HDC_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HDC>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HDC_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HDC_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HDC>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HDC_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HDC_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Integer} 
     */
    static HICON_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HICON_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HICON>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HICON_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HICON_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HICON>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HICON_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HICON_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Integer} 
     */
    static SNB_UserSize64(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserSize64", "uint*", param0, "uint", param1, "ushort*", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static SNB_UserMarshal64(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserMarshal64", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<UInt16>} param2 
     * @returns {Pointer<Byte>} 
     */
    static SNB_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("ole32.dll\SNB_UserUnmarshal64", "uint*", param0, "char*", param1, "ushort*", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<UInt16>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static SNB_UserFree64(param0, param1) {
        DllCall("ole32.dll\SNB_UserFree64", "uint*", param0, "ushort*", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Integer} 
     */
    static STGMEDIUM_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Byte>} 
     */
    static STGMEDIUM_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<STGMEDIUM>} param2 
     * @returns {Pointer<Byte>} 
     */
    static STGMEDIUM_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\STGMEDIUM_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<STGMEDIUM>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static STGMEDIUM_UserFree64(param0, param1) {
        DllCall("OLE32.dll\STGMEDIUM_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * Returns an upper bound on the number of bytes needed to marshal the specified interface pointer to the specified object.
     * @param {Pointer<UInt32>} pulSize A pointer to the upper-bound value on the size, in bytes, of the data packet to be written to the marshaling stream. If this parameter is 0, the size of the packet is unknown.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface whose pointer is to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Pointer<IUnknown>} pUnk A pointer to the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. Values for <i>dwDestContext</i> come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>.
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags Indicates whether the data to be marshaled is to be transmitted back to the client processthe normal case or written to a global table, where it can be retrieved by multiple clients. Values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a>.
     * @returns {HRESULT} This function can return the standard return value E_UNEXPECTED, as well as the following values.
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
     * The upper bound was returned successfully.
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
     * Before this function can be called, either the <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function must be called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetmarshalsizemax
     * @since windows5.0
     */
    static CoGetMarshalSizeMax(pulSize, riid, pUnk, dwDestContext, pvDestContext, mshlflags) {
        result := DllCall("OLE32.dll\CoGetMarshalSizeMax", "uint*", pulSize, "ptr", riid, "ptr", pUnk, "uint", dwDestContext, "ptr", pvDestContext, "uint", mshlflags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes into a stream the data required to initialize a proxy object in some client process.
     * @param {Pointer<IStream>} pStm A pointer to the stream to be used during marshaling. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Pointer<IUnknown>} pUnk A pointer to the interface to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. The possible values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>. Currently, unmarshaling can occur in another apartment of the current process (MSHCTX_INPROC), in another process on the same computer as the current process (MSHCTX_LOCAL), or in a process on a different computer (MSHCTX_DIFFERENTMACHINE).
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags The flags that specify whether the data to be marshaled is to be transmitted back to the client process (the typical  case) or written to a global table, where it can be retrieved by multiple clients. The possibles values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, the stream-access error values returned by <a href="/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, as well as the following values.
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
     * The <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function was not called on the current thread before this function was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-comarshalinterface
     * @since windows5.0
     */
    static CoMarshalInterface(pStm, riid, pUnk, dwDestContext, pvDestContext, mshlflags) {
        result := DllCall("OLE32.dll\CoMarshalInterface", "ptr", pStm, "ptr", riid, "ptr", pUnk, "uint", dwDestContext, "ptr", pvDestContext, "uint", mshlflags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a newly created proxy using data written into the stream by a previous call to the CoMarshalInterface function, and returns an interface pointer to that proxy.
     * @param {Pointer<IStream>} pStm A pointer to the stream from which the interface is to be unmarshaled.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be unmarshaled. For <b>IID_NULL</b>, the returned interface is the one defined by the stream, objref.iid.
     * @param {Pointer<Void>} ppv The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppv</i> contains the requested interface pointer for the unmarshaled interface.
     * @returns {HRESULT} This function can return the standard return value E_FAIL, errors returned by <a href="/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>, and the following values.
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
     * The interface pointer was unmarshaled successfully.
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
     * <i>pStm</i> is an invalid pointer.
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
     * The <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function was not called on the current thread before this function was called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_OBJNOTCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object application has been disconnected from the remoting system (for example, as a result of a call to the <a href="/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a> function).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred reading the registration database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The final <a href="/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> of this function for the requested interface returned E_NOINTERFACE.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-counmarshalinterface
     * @since windows5.0
     */
    static CoUnmarshalInterface(pStm, riid, ppv) {
        result := DllCall("OLE32.dll\CoUnmarshalInterface", "ptr", pStm, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Marshals an HRESULT to the specified stream, from which it can be unmarshaled using the CoUnmarshalHresult function.
     * @param {Pointer<IStream>} pstm A pointer to the marshaling stream. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-comarshalhresult
     * @since windows5.0
     */
    static CoMarshalHresult(pstm, hresult) {
        result := DllCall("OLE32.dll\CoMarshalHresult", "ptr", pstm, "int", hresult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unmarshals an HRESULT type from the specified stream.
     * @param {Pointer<IStream>} pstm A pointer to the stream from which the <b>HRESULT</b> is to be unmarshaled.
     * @param {Pointer<HRESULT>} phresult A pointer to the unmarshaled <b>HRESULT</b>.
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
     * The <b>HRESULT</b> was unmarshaled successfully.
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
     * <i>pStm</i> is an invalid pointer.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-counmarshalhresult
     * @since windows5.0
     */
    static CoUnmarshalHresult(pstm, phresult) {
        result := DllCall("OLE32.dll\CoUnmarshalHresult", "ptr", pstm, "ptr", phresult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Destroys a previously marshaled data packet.
     * @param {Pointer<IStream>} pStm A  pointer to the stream that contains the data packet to be destroyed. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
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
     * The <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function was not called on the current thread before this function was called.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coreleasemarshaldata
     * @since windows5.0
     */
    static CoReleaseMarshalData(pStm) {
        result := DllCall("OLE32.dll\CoReleaseMarshalData", "ptr", pStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a default, or standard, marshaling object in either the client process or the server process, depending on the caller, and returns a pointer to that object's IMarshal implementation.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface whose pointer is to be marshaled. This interface must be derived from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Pointer<IUnknown>} pUnk A pointer to the interface to be marshaled.
     * @param {Integer} dwDestContext The destination context where the specified interface is to be unmarshaled. Values come from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>. Unmarshaling can occur either in another apartment of the current process (MSHCTX_INPROC) or in another process on the same computer as the current process (MSHCTX_LOCAL).
     * @param {Pointer<Void>} pvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} mshlflags Indicates whether the data to be marshaled is to be transmitted back to the client process (the normal case) or written to a global table where it can be retrieved by multiple clients. Values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @param {Pointer<IMarshal>} ppMarshal The address of <b>IMarshal*</b> pointer variable that receives the interface pointer to the standard marshaler.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The <a href="/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> instance was returned successfully.
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
     * Before this function can be called, the <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function must be called on the current thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetstandardmarshal
     * @since windows5.0
     */
    static CoGetStandardMarshal(riid, pUnk, dwDestContext, pvDestContext, mshlflags, ppMarshal) {
        result := DllCall("OLE32.dll\CoGetStandardMarshal", "ptr", riid, "ptr", pUnk, "uint", dwDestContext, "ptr", pvDestContext, "uint", mshlflags, "ptr", ppMarshal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an aggregated standard marshaler for use with lightweight client-side handlers.
     * @param {Pointer<IUnknown>} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>.
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
     * @param {Pointer<IUnknown>} ppUnkInner On successful return, address of pointer to the <a href="https://docs.microsoft.com/windows/desktop/com/iunknown-and-interface-inheritance">IUnknown</a> interface on the newly-created aggregated standard marshaler. If an error occurs, this value is <b>NULL</b>.
     * @returns {HRESULT} This function returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetstdmarshalex
     * @since windows5.0
     */
    static CoGetStdMarshalEx(pUnkOuter, smexflags, ppUnkInner) {
        result := DllCall("OLE32.dll\CoGetStdMarshalEx", "ptr", pUnkOuter, "uint", smexflags, "ptr", ppUnkInner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Marshals an interface pointer from one thread to another thread in the same process.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled.
     * @param {Pointer<IUnknown>} pUnk A pointer to the interface to be marshaled, which must be derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IStream>} ppStm The address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>* pointer variable that receives the interface pointer to the stream that contains the marshaled interface.
     * @returns {HRESULT} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-comarshalinterthreadinterfaceinstream
     * @since windows5.0
     */
    static CoMarshalInterThreadInterfaceInStream(riid, pUnk, ppStm) {
        result := DllCall("OLE32.dll\CoMarshalInterThreadInterfaceInStream", "ptr", riid, "ptr", pUnk, "ptr", ppStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Calculates the wire size of the SAFEARRAY object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_usersize
     */
    static LPSAFEARRAY_UserSize(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_usermarshal
     */
    static LPSAFEARRAY_UserMarshal(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals a SAFEARRAY object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> object does not have the correct dimensions, does not have the correct features, or memory cannot be reallocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_userunmarshal
     */
    static LPSAFEARRAY_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<SAFEARRAY>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_userfree
     */
    static LPSAFEARRAY_UserFree(param0, param1) {
        DllCall("OLEAUT32.dll\LPSAFEARRAY_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the SAFEARRAY object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_usersize64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserSize64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_usermarshal64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals a SAFEARRAY object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<SAFEARRAY>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> object does not have the correct dimensions, does not have the correct features, or memory cannot be reallocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_userunmarshal64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLEAUT32.dll\LPSAFEARRAY_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<SAFEARRAY>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-lpsafearray_userfree64
     * @since windows5.1.2600
     */
    static LPSAFEARRAY_UserFree64(param0, param1) {
        DllCall("OLEAUT32.dll\LPSAFEARRAY_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Integer} 
     */
    static HACCEL_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HACCEL_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HACCEL_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HACCEL>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HACCEL_UserFree(param0, param1) {
        DllCall("OLE32.dll\HACCEL_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Integer} 
     */
    static HGLOBAL_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HGLOBAL_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HGLOBAL_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HGLOBAL>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HGLOBAL_UserFree(param0, param1) {
        DllCall("OLE32.dll\HGLOBAL_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Integer} 
     */
    static HMENU_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HMENU_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HMENU_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HMENU>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HMENU_UserFree(param0, param1) {
        DllCall("OLE32.dll\HMENU_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Integer} 
     */
    static HACCEL_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HACCEL_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HACCEL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HACCEL_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HACCEL_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HACCEL>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HACCEL_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HACCEL_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Integer} 
     */
    static HGLOBAL_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HGLOBAL_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HGLOBAL>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HGLOBAL_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HGLOBAL_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HGLOBAL>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HGLOBAL_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HGLOBAL_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Integer} 
     */
    static HMENU_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HMENU_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HMENU>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HMENU_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HMENU_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HMENU>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HMENU_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HMENU_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Integer} 
     */
    static HPALETTE_UserSize(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HPALETTE_UserMarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HPALETTE_UserUnmarshal(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HPALETTE>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HPALETTE_UserFree(param0, param1) {
        DllCall("OLE32.dll\HPALETTE_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Integer} 
     */
    static HPALETTE_UserSize64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HPALETTE_UserMarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HPALETTE>} param2 
     * @returns {Pointer<Byte>} 
     */
    static HPALETTE_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("OLE32.dll\HPALETTE_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HPALETTE>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HPALETTE_UserFree64(param0, param1) {
        DllCall("OLE32.dll\HPALETTE_UserFree64", "uint*", param0, "ptr", param1)
    }

;@endregion Methods
}
