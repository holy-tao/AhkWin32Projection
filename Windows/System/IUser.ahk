#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IPropertySet.ahk
#Include ..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes a method which is called when the picture that represents a user account is changed.
 * @remarks
 * Applications that want to notify users through this interface can add their class identifier (CLSID) strings as values under this key: 
 * 
 * <pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>SOFTWARE</b>
 *       <b>Microsoft</b>
 *          <b>Windows</b>
 *             <b>CurrentVersion</b>
 *                <b>UserPictureChange</b></pre>
 * 
 * 
 * The values under this key are enumerated to create this callback object.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nn-shobjidl-iuseraccountchangecallback
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUser
     * @type {Guid}
     */
    static IID => Guid("{df9a26c6-e746-4bcd-b5d4-120103c4209b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NonRoamableId", "get_AuthenticationStatus", "get_Type", "GetPropertyAsync", "GetPropertiesAsync", "GetPictureAsync"]

    /**
     * @type {HSTRING} 
     */
    NonRoamableId {
        get => this.get_NonRoamableId()
    }

    /**
     * @type {Integer} 
     */
    AuthenticationStatus {
        get => this.get_AuthenticationStatus()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NonRoamableId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IAsyncOperation<IInspectable>} 
     */
    GetPropertyAsync(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInspectable, operation)
    }

    /**
     * 
     * @param {IVectorView<HSTRING>} values 
     * @returns {IAsyncOperation<IPropertySet>} 
     */
    GetPropertiesAsync(values) {
        result := ComCall(10, this, "ptr", values, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IPropertySet, operation)
    }

    /**
     * 
     * @param {Integer} desiredSize 
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     */
    GetPictureAsync(desiredSize) {
        result := ComCall(11, this, "int", desiredSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamReference, operation)
    }
}
