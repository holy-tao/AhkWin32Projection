#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IAudioStreamDescriptor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamDescriptor2
     * @type {Guid}
     */
    static IID => Guid("{2e68f1f6-a448-497b-8840-85082665acf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_LeadingEncoderPadding", "get_LeadingEncoderPadding", "put_TrailingEncoderPadding", "get_TrailingEncoderPadding"]

    /**
     * @type {IReference<Integer>} 
     */
    LeadingEncoderPadding {
        get => this.get_LeadingEncoderPadding()
        set => this.put_LeadingEncoderPadding(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    TrailingEncoderPadding {
        get => this.get_TrailingEncoderPadding()
        set => this.put_TrailingEncoderPadding(value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LeadingEncoderPadding(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LeadingEncoderPadding() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_TrailingEncoderPadding(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TrailingEncoderPadding() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
