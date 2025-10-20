#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Loads font file data from a custom font file loader.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfilestream
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFileStream extends IUnknown{
    /**
     * The interface identifier for IDWriteFontFileStream
     * @type {Guid}
     */
    static IID => Guid("{6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Void>} fragmentStart 
     * @param {Integer} fileOffset 
     * @param {Integer} fragmentSize 
     * @param {Pointer<Void>} fragmentContext 
     * @returns {HRESULT} 
     */
    ReadFileFragment(fragmentStart, fileOffset, fragmentSize, fragmentContext) {
        result := ComCall(3, this, "ptr", fragmentStart, "uint", fileOffset, "uint", fragmentSize, "ptr", fragmentContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} fragmentContext 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseFileFragment(fragmentContext) {
        ComCall(4, this, "ptr", fragmentContext)
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Pointer<UInt64>} fileSize 
     * @returns {HRESULT} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(fileSize) {
        result := ComCall(5, this, "uint*", fileSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} lastWriteTime 
     * @returns {HRESULT} 
     */
    GetLastWriteTime(lastWriteTime) {
        result := ComCall(6, this, "uint*", lastWriteTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
