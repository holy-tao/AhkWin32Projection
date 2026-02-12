#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MediaFrameReference.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMultiSourceMediaFrameReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiSourceMediaFrameReference
     * @type {Guid}
     */
    static IID => Guid("{21964b1a-7fe2-44d6-92e5-298e6d2810e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetFrameReferenceBySourceId"]

    /**
     * 
     * @param {HSTRING} sourceId 
     * @returns {MediaFrameReference} 
     */
    TryGetFrameReferenceBySourceId(sourceId) {
        if(sourceId is String) {
            pin := HSTRING.Create(sourceId)
            sourceId := pin.Value
        }
        sourceId := sourceId is Win32Handle ? NumGet(sourceId, "ptr") : sourceId

        result := ComCall(6, this, "ptr", sourceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameReference(value)
    }
}
