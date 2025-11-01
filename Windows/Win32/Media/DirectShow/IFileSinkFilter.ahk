#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFileSinkFilter interface is implemented on filters that write media streams to a file.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter2">IFileSinkFilter2</a> interface extends <b>IFileSinkFilter</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifilesinkfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFileSinkFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSinkFilter
     * @type {Guid}
     */
    static IID => Guid("{a2104830-7c70-11cf-8bce-00aa00a3f1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFileName", "GetCurFile"]

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter-setfilename
     */
    SetFileName(pszFileName, pmt) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFileName 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter-getcurfile
     */
    GetCurFile(ppszFileName, pmt) {
        result := ComCall(4, this, "ptr", ppszFileName, "ptr", pmt, "HRESULT")
        return result
    }
}
