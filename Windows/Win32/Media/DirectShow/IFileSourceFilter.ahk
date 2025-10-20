#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFileSourceFilter interface is exposed by source filters to set the file name and media type of the media file that they are to render.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifilesourcefilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFileSourceFilter extends IUnknown{
    /**
     * The interface identifier for IFileSourceFilter
     * @type {Guid}
     */
    static IID => Guid("{56a868a6-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    Load(pszFileName, pmt) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFileName 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    GetCurFile(ppszFileName, pmt) {
        result := ComCall(4, this, "ptr", ppszFileName, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
