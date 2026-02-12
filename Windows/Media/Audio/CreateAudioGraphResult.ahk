#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateAudioGraphResult.ahk
#Include .\ICreateAudioGraphResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create an audio graph.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateAsync](audiograph_createasync_145006550.md). Check the [Status](createaudiographresult_status.md) property to determine if the node was successfully created, and if so, get the instance of the audio graph with the [Graph](createaudiographresult_graph.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiographresult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateAudioGraphResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateAudioGraphResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateAudioGraphResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create an [AudioGraph](audiograph.md) with a call to [AudioGraph.CreateAsync](audiograph_createasync_145006550.md).
     * @remarks
     * If the result status is **Success**, get the instance of the audio graph with the [Graph](createaudiographresult_graph.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiographresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the audio graph object.
     * @remarks
     * This value will be null if the [Status](createaudiographresult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiographresult.graph
     * @type {AudioGraph} 
     */
    Graph {
        get => this.get_Graph()
    }

    /**
     * Gets the extended error code associated with the creation of a [AudioGraph](audiograph.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiographresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ICreateAudioGraphResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioGraphResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioGraphResult := ICreateAudioGraphResult(outPtr)
        }

        return this.__ICreateAudioGraphResult.get_Status()
    }

    /**
     * 
     * @returns {AudioGraph} 
     */
    get_Graph() {
        if (!this.HasProp("__ICreateAudioGraphResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioGraphResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioGraphResult := ICreateAudioGraphResult(outPtr)
        }

        return this.__ICreateAudioGraphResult.get_Graph()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateAudioGraphResult2")) {
            if ((queryResult := this.QueryInterface(ICreateAudioGraphResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioGraphResult2 := ICreateAudioGraphResult2(outPtr)
        }

        return this.__ICreateAudioGraphResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
