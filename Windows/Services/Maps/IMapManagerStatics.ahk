#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{37e3e515-82b4-4d54-8fd9-af2624b3011c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowDownloadedMapsUI", "ShowMapsUpdateUI"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowDownloadedMapsUI() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowMapsUpdateUI() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
