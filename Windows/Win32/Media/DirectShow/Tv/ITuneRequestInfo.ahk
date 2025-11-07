#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITuneRequestInfo interface is implemented on the BDA MPEG2 Transport Information Filter (TIF) and is used by the Network Provider.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuneRequestInfo)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-itunerequestinfo
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuneRequestInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuneRequestInfo
     * @type {Guid}
     */
    static IID => Guid("{a3b152df-7a90-4218-ac54-9830bee8c0b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocatorData", "GetComponentData", "CreateComponentList", "GetNextProgram", "GetPreviousProgram", "GetNextLocator", "GetPreviousLocator"]

    /**
     * 
     * @param {ITuneRequest} Request 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getlocatordata
     */
    GetLocatorData(Request) {
        result := ComCall(3, this, "ptr", Request, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getcomponentdata
     */
    GetComponentData(CurrentRequest) {
        result := ComCall(4, this, "ptr", CurrentRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-createcomponentlist
     */
    CreateComponentList(CurrentRequest) {
        result := ComCall(5, this, "ptr", CurrentRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getnextprogram
     */
    GetNextProgram(CurrentRequest) {
        result := ComCall(6, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getpreviousprogram
     */
    GetPreviousProgram(CurrentRequest) {
        result := ComCall(7, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getnextlocator
     */
    GetNextLocator(CurrentRequest) {
        result := ComCall(8, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-itunerequestinfo-getpreviouslocator
     */
    GetPreviousLocator(CurrentRequest) {
        result := ComCall(9, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }
}
