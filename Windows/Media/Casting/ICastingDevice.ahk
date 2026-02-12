#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CastingConnection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingDevice
     * @type {Guid}
     */
    static IID => Guid("{de721c83-4a43-4ad1-a6d2-2492a796c3f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_FriendlyName", "get_Icon", "GetSupportedCastingPlaybackTypesAsync", "CreateCastingConnection"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {IRandomAccessStreamWithContentType} 
     */
    Icon {
        get => this.get_Icon()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_Icon() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamWithContentType(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetSupportedCastingPlaybackTypesAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @returns {CastingConnection} 
     */
    CreateCastingConnection() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingConnection(value)
    }
}
