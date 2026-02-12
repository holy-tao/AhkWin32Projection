#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToSourceSelectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToSourceSelectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0c9d8511-5202-4dcb-8c67-abda12bb3c12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FriendlyName", "get_Icon", "get_SupportsImage", "get_SupportsAudio", "get_SupportsVideo"]

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
     * @type {Boolean} 
     */
    SupportsImage {
        get => this.get_SupportsImage()
    }

    /**
     * @type {Boolean} 
     */
    SupportsAudio {
        get => this.get_SupportsAudio()
    }

    /**
     * @type {Boolean} 
     */
    SupportsVideo {
        get => this.get_SupportsVideo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamWithContentType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsImage() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsAudio() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVideo() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
