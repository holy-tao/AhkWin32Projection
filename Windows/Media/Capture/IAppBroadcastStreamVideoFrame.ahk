#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastStreamVideoHeader.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastStreamVideoFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastStreamVideoFrame
     * @type {Guid}
     */
    static IID => Guid("{0f97cf2b-c9e4-4e88-8194-d814cbd585d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoHeader", "get_VideoBuffer"]

    /**
     * @type {AppBroadcastStreamVideoHeader} 
     */
    VideoHeader {
        get => this.get_VideoHeader()
    }

    /**
     * @type {IBuffer} 
     */
    VideoBuffer {
        get => this.get_VideoBuffer()
    }

    /**
     * 
     * @returns {AppBroadcastStreamVideoHeader} 
     */
    get_VideoHeader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastStreamVideoHeader(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_VideoBuffer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
