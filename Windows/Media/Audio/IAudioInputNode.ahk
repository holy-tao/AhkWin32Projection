#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AudioGraphConnection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines an audio input node.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioInputNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioInputNode
     * @type {Guid}
     */
    static IID => Guid("{d148005c-8428-4784-b7fd-a99d468c5d20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutgoingConnections", "AddOutgoingConnection", "AddOutgoingConnectionWithGain", "RemoveOutgoingConnection"]

    /**
     * Gets outgoing connections for the audio input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode.outgoingconnections
     * @type {IVectorView<AudioGraphConnection>} 
     */
    OutgoingConnections {
        get => this.get_OutgoingConnections()
    }

    /**
     * 
     * @returns {IVectorView<AudioGraphConnection>} 
     */
    get_OutgoingConnections() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioGraphConnection, value)
    }

    /**
     * Adds an outgoing connection to the audio input node.
     * @param {IAudioNode} destination The destination node for the connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode.addoutgoingconnection
     */
    AddOutgoingConnection(destination) {
        result := ComCall(7, this, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an outgoing connection with gain to the audio input node.
     * @param {IAudioNode} destination The destination node for the connection.
     * @param {Float} gain A value indicating the gain associated with the connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode.addoutgoingconnection
     */
    AddOutgoingConnectionWithGain(destination, gain) {
        result := ComCall(8, this, "ptr", destination, "double", gain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the outgoing connection from the audio input node to the specified node.
     * @remarks
     * Add an outgoing connection by calling [AddOutgoingConnection](iaudioinputnode_addoutgoingconnection_702981438.md).
     * @param {IAudioNode} destination The audio node for which the outgoing connection is removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode.removeoutgoingconnection
     */
    RemoveOutgoingConnection(destination) {
        result := ComCall(9, this, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
