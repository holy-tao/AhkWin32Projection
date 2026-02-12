#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageWithMetadata extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageWithMetadata
     * @type {Guid}
     */
    static IID => Guid("{95949780-1de9-40f2-b452-0de9f1910012}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstallDate", "GetThumbnailToken", "Launch"]

    /**
     * @type {DateTime} 
     */
    InstallDate {
        get => this.get_InstallDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_InstallDate() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetThumbnailToken() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Enumerate the Uniform Resource Identifiers (URI) handlers on the device.
     * @remarks
     * This API may also be called from Windows desktop application but does not return Windows desktop application.
     * @param {HSTRING} parameters 
     * @returns {HRESULT} A list of [AppInfo](../windows.applicationmodel/appinfo.md) objects representing each application that handles the specified http(s) URI.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.findappurihandlersasync
     */
    Launch(parameters) {
        if(parameters is String) {
            pin := HSTRING.Create(parameters)
            parameters := pin.Value
        }
        parameters := parameters is Win32Handle ? NumGet(parameters, "ptr") : parameters

        result := ComCall(8, this, "ptr", parameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
