#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated because it is the program associated with a protocol.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IProtocolActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtocolActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6095f4dd-b7c0-46ab-81fe-d90f36d00d24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri"]

    /**
     * Gets the Uniform Resource Identifier (URI) for which the app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolactivatedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
