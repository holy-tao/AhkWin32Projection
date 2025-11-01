#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to describe a content provider.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportcontentprovider
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportContentProvider extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportContentProvider
     * @type {Guid}
     */
    static IID => Guid("{b9489f24-f219-4acf-aad7-265c7c08a6ae}")

    /**
     * The class identifier for WdsTransportContentProvider
     * @type {Guid}
     */
    static CLSID => Guid("{e0be741f-5a75-4eb9-8a2d-5e189b45f327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Description", "get_FilePath", "get_InitializationRoutine"]

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_name
     */
    get_Name(pbszName) {
        result := ComCall(7, this, "ptr", pbszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_description
     */
    get_Description(pbszDescription) {
        result := ComCall(8, this, "ptr", pbszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszFilePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_filepath
     */
    get_FilePath(pbszFilePath) {
        result := ComCall(9, this, "ptr", pbszFilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszInitializationRoutine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_initializationroutine
     */
    get_InitializationRoutine(pbszInitializationRoutine) {
        result := ComCall(10, this, "ptr", pbszInitializationRoutine, "HRESULT")
        return result
    }
}
