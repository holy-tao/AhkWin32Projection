#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDescriptor
     * @type {Guid}
     */
    static IID => Guid("{0a89f216-5f9d-4874-8904-da9ad3f5528f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Length", "get_DescriptorType", "ReadDescriptorBuffer"]

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {Integer} 
     */
    DescriptorType {
        get => this.get_DescriptorType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DescriptorType() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HRESULT} 
     */
    ReadDescriptorBuffer(buffer_) {
        result := ComCall(8, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
