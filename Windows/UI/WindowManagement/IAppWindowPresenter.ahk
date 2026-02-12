#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppWindowPresentationConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowPresenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowPresenter
     * @type {Guid}
     */
    static IID => Guid("{5ae9ed73-e1fd-5317-ad78-5a3ed271bbde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConfiguration", "IsPresentationSupported", "RequestPresentation", "RequestPresentationByKind"]

    /**
     * Read the active configuration of the collector.
     * @returns {AppWindowPresentationConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-getconfiguration
     */
    GetConfiguration() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppWindowPresentationConfiguration(result_)
    }

    /**
     * 
     * @param {Integer} presentationKind 
     * @returns {Boolean} 
     */
    IsPresentationSupported(presentationKind) {
        result := ComCall(7, this, "int", presentationKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {AppWindowPresentationConfiguration} configuration 
     * @returns {Boolean} 
     */
    RequestPresentation(configuration) {
        result := ComCall(8, this, "ptr", configuration, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} presentationKind 
     * @returns {Boolean} 
     */
    RequestPresentationByKind(presentationKind) {
        result := ComCall(9, this, "int", presentationKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
