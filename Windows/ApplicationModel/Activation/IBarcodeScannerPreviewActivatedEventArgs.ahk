#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Describes event arguments used in activating the barcode scanner preview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ibarcodescannerpreviewactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerPreviewActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerPreviewActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6772797c-99bf-4349-af22-e4123560371c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionId"]

    /**
     * Gets a connection ID used to match the service connection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ibarcodescannerpreviewactivatedeventargs.connectionid
     * @type {HSTRING} 
     */
    ConnectionId {
        get => this.get_ConnectionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
