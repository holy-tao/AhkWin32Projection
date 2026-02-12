#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IVolumeChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVolumeChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6f026d5c-cf75-4c2b-913e-6d7c6c329179}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Volume"]

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
