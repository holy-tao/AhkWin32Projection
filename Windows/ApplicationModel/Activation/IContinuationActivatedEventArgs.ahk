#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated after an operation that suspends the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontinuationactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContinuationActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContinuationActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e58106b5-155f-4a94-a742-c7e08f4e188c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContinuationData"]

    /**
     * Gets a set of values populated by the app before an operation that deactivates the app in order to provide context when the app is activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontinuationactivatedeventargs.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
