#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFaceAuthenticationGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFaceAuthenticationGroup
     * @type {Guid}
     */
    static IID => Guid("{e8019814-4a91-41b0-83a6-881a1775353e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameProviderIds"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    FrameProviderIds {
        get => this.get_FrameProviderIds()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_FrameProviderIds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
