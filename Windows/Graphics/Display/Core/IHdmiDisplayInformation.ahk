#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\HdmiDisplayMode.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class IHdmiDisplayInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHdmiDisplayInformation
     * @type {Guid}
     */
    static IID => Guid("{130b3c0a-f565-476e-abd5-ea05aee74c69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedDisplayModes", "GetCurrentDisplayMode", "SetDefaultDisplayModeAsync", "RequestSetCurrentDisplayModeAsync", "RequestSetCurrentDisplayModeWithHdrAsync", "RequestSetCurrentDisplayModeWithHdrAndMetadataAsync", "add_DisplayModesChanged", "remove_DisplayModesChanged"]

    /**
     * 
     * @returns {IVectorView<HdmiDisplayMode>} 
     */
    GetSupportedDisplayModes() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HdmiDisplayMode, result_)
    }

    /**
     * 
     * @returns {HdmiDisplayMode} 
     */
    GetCurrentDisplayMode() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HdmiDisplayMode(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SetDefaultDisplayModeAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HdmiDisplayMode} mode_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestSetCurrentDisplayModeAsync(mode_) {
        result := ComCall(9, this, "ptr", mode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HdmiDisplayMode} mode_ 
     * @param {Integer} hdrOption 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestSetCurrentDisplayModeWithHdrAsync(mode_, hdrOption) {
        result := ComCall(10, this, "ptr", mode_, "int", hdrOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HdmiDisplayMode} mode_ 
     * @param {Integer} hdrOption 
     * @param {HdmiDisplayHdr2086Metadata} hdrMetadata 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestSetCurrentDisplayModeWithHdrAndMetadataAsync(mode_, hdrOption, hdrMetadata) {
        result := ComCall(11, this, "ptr", mode_, "int", hdrOption, "ptr", hdrMetadata, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<HdmiDisplayInformation, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayModesChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisplayModesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
