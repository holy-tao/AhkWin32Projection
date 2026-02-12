#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastViewerCountChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastViewerCountChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e6e11825-5401-4ade-8bd2-c14ecee6807d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewerCount"]

    /**
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewerCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
