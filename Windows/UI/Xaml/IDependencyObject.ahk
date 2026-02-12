#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Core\CoreDispatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDependencyObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDependencyObject
     * @type {Guid}
     */
    static IID => Guid("{5c526665-f60e-4912-af59-5fe0680f089d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "SetValue", "ClearValue", "ReadLocalValue", "GetAnimationBaseValue", "get_Dispatcher"]

    /**
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @param {DependencyProperty} dp 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValue(dp) {
        result := ComCall(6, this, "ptr", dp, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * SetValue Method (ServerSettingsGeneralFlag Class)
     * @param {DependencyProperty} dp 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/serversettingsgeneralflag-class/setvalue-method-serversettingsgeneralflag-class
     */
    SetValue(dp, value) {
        result := ComCall(7, this, "ptr", dp, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DependencyProperty} dp 
     * @returns {HRESULT} 
     */
    ClearValue(dp) {
        result := ComCall(8, this, "ptr", dp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DependencyProperty} dp 
     * @returns {IInspectable} 
     */
    ReadLocalValue(dp) {
        result := ComCall(9, this, "ptr", dp, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {DependencyProperty} dp 
     * @returns {IInspectable} 
     */
    GetAnimationBaseValue(dp) {
        result := ComCall(10, this, "ptr", dp, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreDispatcher(value)
    }
}
