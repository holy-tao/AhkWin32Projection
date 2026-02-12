#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetCfgComponent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgBindingInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgBindingInterface
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae94-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetUpperComponent", "GetLowerComponent"]

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppszwInterfaceName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszwInterfaceName
    }

    /**
     * 
     * @returns {INetCfgComponent} 
     */
    GetUpperComponent() {
        result := ComCall(4, this, "ptr*", &ppnccItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INetCfgComponent(ppnccItem)
    }

    /**
     * 
     * @returns {INetCfgComponent} 
     */
    GetLowerComponent() {
        result := ComCall(5, this, "ptr*", &ppnccItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INetCfgComponent(ppnccItem)
    }
}
