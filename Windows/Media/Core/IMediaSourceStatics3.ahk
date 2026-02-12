#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSourceStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSourceStatics3
     * @type {Guid}
     */
    static IID => Guid("{453a30d6-2bea-4122-9f73-eace04526e35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromMediaFrameSource"]

    /**
     * 
     * @param {MediaFrameSource} frameSource 
     * @returns {MediaSource} 
     */
    CreateFromMediaFrameSource(frameSource) {
        result := ComCall(6, this, "ptr", frameSource, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }
}
