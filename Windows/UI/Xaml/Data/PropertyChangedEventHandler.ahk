#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [PropertyChanged](inotifypropertychanged_propertychanged.md) event. When programming with Microsoft .NET this delegate is hidden, use the [System.ComponentModel.PropertyChangedEventHandler](/dotnet/api/system.componentmodel.propertychangedeventhandler?view=dotnet-uwp-10.0&preserve-view=true) delegate.
 * @remarks
 * When programming with Microsoft .NET, this delegate is hidden. Microsoft .NET Developers should use the [System.ComponentModel.PropertyChangedEventHandler](/dotnet/api/system.componentmodel.propertychangedeventhandler?view=dotnet-uwp-10.0&preserve-view=true) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.propertychangedeventhandler
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class PropertyChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for PropertyChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{50f19c16-0a22-4d8e-a089-1ea9951657d2}")

    /**
     * The class identifier for PropertyChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{50f19c16-0a22-4d8e-a089-1ea9951657d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {PropertyChangedEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
