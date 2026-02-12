#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameFormat.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include .\BufferMediaFrame.ahk
#Include .\VideoMediaFrame.ahk
#Include ..\..\..\Perception\Spatial\SpatialCoordinateSystem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameReference
     * @type {Guid}
     */
    static IID => Guid("{f6b88641-f0dc-4044-8dc9-961cedd05bad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceKind", "get_Format", "get_SystemRelativeTime", "get_Duration", "get_Properties", "get_BufferMediaFrame", "get_VideoMediaFrame", "get_CoordinateSystem"]

    /**
     * @type {Integer} 
     */
    SourceKind {
        get => this.get_SourceKind()
    }

    /**
     * @type {MediaFrameFormat} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {BufferMediaFrame} 
     */
    BufferMediaFrame {
        get => this.get_BufferMediaFrame()
    }

    /**
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameFormat(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }

    /**
     * 
     * @returns {BufferMediaFrame} 
     */
    get_BufferMediaFrame() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BufferMediaFrame(value)
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoMediaFrame(value)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }
}
