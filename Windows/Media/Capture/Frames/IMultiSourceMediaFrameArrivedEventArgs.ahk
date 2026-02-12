#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMultiSourceMediaFrameArrivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiSourceMediaFrameArrivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{63115e01-cf51-48fd-aab0-6d693eb48127}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
