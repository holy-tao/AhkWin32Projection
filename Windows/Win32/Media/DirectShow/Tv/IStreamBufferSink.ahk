#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferSink interface is exposed by the Stream Buffer Sink filter. Use this interface to lock the filter before capture and to create new recordings.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSink
     * @type {Guid}
     */
    static IID => Guid("{afd1f242-7efd-45ee-ba4e-407a25c9a77a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockProfile", "CreateRecorder", "IsProfileLocked"]

    /**
     * 
     * @param {PWSTR} pszStreamBufferFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink-lockprofile
     */
    LockProfile(pszStreamBufferFilename) {
        pszStreamBufferFilename := pszStreamBufferFilename is String ? StrPtr(pszStreamBufferFilename) : pszStreamBufferFilename

        result := ComCall(3, this, "ptr", pszStreamBufferFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFilename 
     * @param {Integer} dwRecordType 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink-createrecorder
     */
    CreateRecorder(pszFilename, dwRecordType) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(4, this, "ptr", pszFilename, "uint", dwRecordType, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IUnknown(pRecordingIUnknown)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink-isprofilelocked
     */
    IsProfileLocked() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
