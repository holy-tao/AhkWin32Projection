#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\CoreApplicationView.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreImmersiveApplication extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreImmersiveApplication
     * @type {Guid}
     */
    static IID => Guid("{1ada0e3e-e4a2-4123-b451-dc96bf800419}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Views", "CreateNewView", "get_MainView"]

    /**
     * @type {IVectorView<CoreApplicationView>} 
     */
    Views {
        get => this.get_Views()
    }

    /**
     * @type {CoreApplicationView} 
     */
    MainView {
        get => this.get_MainView()
    }

    /**
     * 
     * @returns {IVectorView<CoreApplicationView>} 
     */
    get_Views() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(CoreApplicationView, value)
    }

    /**
     * 
     * @param {HSTRING} runtimeType 
     * @param {HSTRING} entryPoint 
     * @returns {CoreApplicationView} 
     */
    CreateNewView(runtimeType, entryPoint) {
        if(runtimeType is String) {
            pin := HSTRING.Create(runtimeType)
            runtimeType := pin.Value
        }
        runtimeType := runtimeType is Win32Handle ? NumGet(runtimeType, "ptr") : runtimeType
        if(entryPoint is String) {
            pin := HSTRING.Create(entryPoint)
            entryPoint := pin.Value
        }
        entryPoint := entryPoint is Win32Handle ? NumGet(entryPoint, "ptr") : entryPoint

        result := ComCall(7, this, "ptr", runtimeType, "ptr", entryPoint, "ptr*", &view_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreApplicationView(view_)
    }

    /**
     * 
     * @returns {CoreApplicationView} 
     */
    get_MainView() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreApplicationView(value)
    }
}
