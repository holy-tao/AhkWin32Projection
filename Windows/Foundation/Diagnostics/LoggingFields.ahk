#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoggingFields.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a sequence of event fields and provides methods for adding fields to the sequence.
 * @remarks
 * You can pass this object to a **LoggingChannel**.[LogEvent](loggingactivity_logevent_1783961521.md) method to provide the payload (data) for an event.
 * 
 * This class is not thread-safe. Ensure that an instance of this class is not modified simultaneously by multiple threads.
 * 
 * This class can create nested structures. To create a structure, call [BeginStruct](loggingfields_beginstruct_359748894.md) to mark the start of the structure. Then add the fields that are part of the structure. Finally, call [EndStruct ](loggingfields_endstruct_494341079.md) to mark the end of the structure. Structures can be nested up to eight levels deep.
 * 
 * 
 * 
 * > [!TIP]
 * > Field names and field tags should be used for infrequently-changing metadata, not for frequently-changing data. The values for field names and tags should generally be constants, not variables. Event names, event tags, field names, field tags, and field formats are part of an event’s identity, and each unique event identity is tracked by a [LoggingChannel](loggingchannel.md). Using frequently-changing values for field names and tags will lead to increased memory usage in your application, and may make event decoding or analysis more complex.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingFields extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoggingFields

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoggingFields.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new **LoggingFields** instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingFields")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Removes all fields stored in the object and resets the object to its newly-constructed state.
     * @remarks
     * This method allows you to reuse a **LoggingFields** instance with multiple events which improves performance by avoiding unnecessary object creation, payload buffer allocation, and garbage collection overhead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.clear
     */
    Clear() {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.Clear()
    }

    /**
     * Begins a new structured field with the specified field name.
     * @param {HSTRING} name Name of the structured field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.beginstruct
     */
    BeginStruct(name) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.BeginStruct(name)
    }

    /**
     * Begins a new structured field with the specified field name and tags.
     * @param {HSTRING} name Name of the structured field.
     * @param {Integer} tags Specifies up to twenty-eight bits of user-defined field metadata. The top four bits are reserved and must be set to zero (0).The metadata may be used by a custom Event Tracing for Windows (ETW) processing tool. For example, you might define a tag that indicates that a field might contain personally-identifiable information.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.beginstruct
     */
    BeginStructWithTags(name, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.BeginStructWithTags(name, tags)
    }

    /**
     * Ends a structured field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.endstruct
     */
    EndStruct() {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.EndStruct()
    }

    /**
     * Adds an empty field.
     * @remarks
     * An empty field has a name, optional format and tags, but no value.
     * @param {HSTRING} name Name of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addempty
     */
    AddEmpty(name) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddEmpty(name)
    }

    /**
     * Adds an empty field.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addempty
     */
    AddEmptyWithFormat(name, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddEmptyWithFormat(name, format)
    }

    /**
     * Adds an empty field.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addempty
     */
    AddEmptyWithFormatAndTags(name, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddEmptyWithFormatAndTags(name, format, tags)
    }

    /**
     * Adds an 8-bit unsigned integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8
     */
    AddUInt8(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8(name, value)
    }

    /**
     * Adds an 8-bit unsigned integer field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8
     */
    AddUInt8WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8WithFormat(name, value, format)
    }

    /**
     * Adds an 8-bit unsigned integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8
     */
    AddUInt8WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds an 8-bit unsigned integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The format for the array is binary.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8array
     */
    AddUInt8Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8Array(name, value_length, value)
    }

    /**
     * Adds an 8-bit unsigned integer array field with the specified field name and format.
     * @remarks
     * Use the *format* parameter to specify the format of the array. You may use the following [LoggingFieldFormat](loggingfieldformat.md) formats:
     * 
     * | Value | Description |
     * |---|---|
     * | Default | No format is specified. |
     * | Boolean | Data is treated as an array of boolean values |
     * | Hexadecimal | Data is treated as an array of 8-bit integers, formatted as hexadecimal |
     * | Ipv6Address | Data is treated as an IPv6 address |
     * | Json | Data is treated as a Multi-Byte Character Set (MBCS) JavaScript Object Notation (JSON) string |
     * | Signed | Data is treated as an array of signed 8-bit integers |
     * | String | Data is treated as a MBCS string |
     * | SocketAddress | Data is treated as a [sockaddr](/windows/desktop/WinSock/sockaddr-2) |
     * | Unsigned | Data is treated as an array of unsigned 8-bit integers |
     * | XML | Data is treated as an MBCS XML string |
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The default format for the array is binary. See the remarks section for other formats that may be specified.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8array
     */
    AddUInt8ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds an 8-bit unsigned integer array field with the specified field name, format, and tags.
     * @remarks
     * Use the *format* parameter to specify the format of the array. You may use the following [LoggingFieldFormat](loggingfieldformat.md) formats:<table>
     *    <tr><td>Default</td><td>No format is specified.</td></tr>
     *    <tr><td>Boolean</td><td>Data is treated as an array of boolean values</td></tr>
     *    <tr><td>Hexadecimal</td><td>Data is treated as an array of 8-bit integers, formatted as hexadecimal</td></tr>
     *    <tr><td>Ipv6Address</td><td>Data is treated as an IPv6 address</td></tr>
     *    <tr><td>Json</td><td>Data is treated as a Multi-Byte Character Set (MBCS) JavaScript Object Notation (JSON) string</td></tr>
     *    <tr><td>Signed</td><td>Data is treated as an array of signed 8-bit integers</td></tr>
     *    <tr><td>String</td><td>Data is treated as a MBCS string</td></tr>
     *    <tr><td>SocketAddress</td><td>Data is treated as a [sockaddr](/windows/desktop/WinSock/sockaddr-2)</td></tr>
     *    <tr><td>Unsigned</td><td>Data is treated as an array of unsigned 8-bit integers</td></tr>
     *    <tr><td>XML</td><td>Data is treated as an MBCS XML string</td></tr>
     * </table>
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The default format for the array is binary. See the remarks section for other formats that may be specified.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint8array
     */
    AddUInt8ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt8ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 16-bit integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16
     */
    AddInt16(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16(name, value)
    }

    /**
     * Adds a 16-bit integer field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16
     */
    AddInt16WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16WithFormat(name, value, format)
    }

    /**
     * Adds a 16-bit integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16
     */
    AddInt16WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 16-bit integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16array
     */
    AddInt16Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16Array(name, value_length, value)
    }

    /**
     * Adds a 16-bit integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16array
     */
    AddInt16ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 16-bit integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint16array
     */
    AddInt16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt16ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 16-bit unsigned integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16
     */
    AddUInt16(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16(name, value)
    }

    /**
     * Adds a 16-bit unsigned integer field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16
     */
    AddUInt16WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16WithFormat(name, value, format)
    }

    /**
     * Adds a 16-bit unsigned integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16
     */
    AddUInt16WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a16-bit unsigned integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The default format for the array is binary. See the remarks section for other formats that may be specified.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16array
     */
    AddUInt16Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16Array(name, value_length, value)
    }

    /**
     * Adds a 16-bit unsigned integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The default format for the array is binary. See the remarks section for other formats that may be specified.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16array
     */
    AddUInt16ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 16-bit unsigned integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field. The default format for the array is binary. See the remarks section for other formats that may be specified.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint16array
     */
    AddUInt16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt16ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32
     */
    AddInt32(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32(name, value)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32
     */
    AddInt32WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32WithFormat(name, value, format)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32
     */
    AddInt32WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32array
     */
    AddInt32Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32Array(name, value_length, value)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32array
     */
    AddInt32ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 32-bit integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint32array
     */
    AddInt32ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt32ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 32-bit unsigned integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32
     */
    AddUInt32(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32(name, value)
    }

    /**
     * Adds a 32-bit unsigned integer field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32
     */
    AddUInt32WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32WithFormat(name, value, format)
    }

    /**
     * Adds a 32-bit unsigned integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32
     */
    AddUInt32WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 32-bit unsigned integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32array
     */
    AddUInt32Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32Array(name, value_length, value)
    }

    /**
     * Adds a 32-bit unsigned integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32array
     */
    AddUInt32ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 32-bit unsigned integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint32array
     */
    AddUInt32ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt32ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 64-bit integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The array values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64
     */
    AddInt64(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64(name, value)
    }

    /**
     * Adds a 64-bit integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64
     */
    AddInt64WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64WithFormat(name, value, format)
    }

    /**
     * Adds a 64-bit integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64
     */
    AddInt64WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 64-bit integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64array
     */
    AddInt64Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64Array(name, value_length, value)
    }

    /**
     * Adds a 64-bit integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64array
     */
    AddInt64ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 64-bit integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addint64array
     */
    AddInt64ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddInt64ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 64-bit unsigned integer field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64
     */
    AddUInt64(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64(name, value)
    }

    /**
     * Adds a 64-bit unsigned integer field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64
     */
    AddUInt64WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64WithFormat(name, value, format)
    }

    /**
     * Adds a 64-bit unsigned integer field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64
     */
    AddUInt64WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 64-bit unsigned integer array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64array
     */
    AddUInt64Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64Array(name, value_length, value)
    }

    /**
     * Adds a 64-bit unsigned integer array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64array
     */
    AddUInt64ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 64-bit unsigned integer array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adduint64array
     */
    AddUInt64ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddUInt64ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsingle
     */
    AddSingle(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingle(name, value)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsingle
     */
    AddSingleWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingleWithFormat(name, value, format)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsingle
     */
    AddSingleWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingleWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsinglearray
     */
    AddSingleArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingleArray(name, value_length, value)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsinglearray
     */
    AddSingleArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingleArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsinglearray
     */
    AddSingleArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSingleArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddouble
     */
    AddDouble(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDouble(name, value)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddouble
     */
    AddDoubleWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDoubleWithFormat(name, value, format)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Float} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddouble
     */
    AddDoubleWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDoubleWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The array of values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddoublearray
     */
    AddDoubleArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDoubleArray(name, value_length, value)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddoublearray
     */
    AddDoubleArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDoubleArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddoublearray
     */
    AddDoubleArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDoubleArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a 16-bit character field with the specified field name.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value The value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16
     */
    AddChar16(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16(name, value)
    }

    /**
     * Adds a 16-bit character field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16
     */
    AddChar16WithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16WithFormat(name, value, format)
    }

    /**
     * Adds a 16-bit character field with the specified field name, format, and tag.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16
     */
    AddChar16WithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16WithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a 16-bit character array field with the specified field name.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array of values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16array
     */
    AddChar16Array(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16Array(name, value_length, value)
    }

    /**
     * Adds a 16-bit character array field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16array
     */
    AddChar16ArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16ArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a 16-bit character array field with the specified field name and format, and tags.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addchar16array
     */
    AddChar16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddChar16ArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a boolean field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Boolean} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addboolean
     */
    AddBoolean(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBoolean(name, value)
    }

    /**
     * Adds a boolean field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {Boolean} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addboolean
     */
    AddBooleanWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBooleanWithFormat(name, value, format)
    }

    /**
     * Adds a boolean field with the specified field name, format, and tags.
     * @param {HSTRING} name The name of the event field.
     * @param {Boolean} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addboolean
     */
    AddBooleanWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBooleanWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a boolean array field with the specified field name.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value The array values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addbooleanarray
     */
    AddBooleanArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBooleanArray(name, value_length, value)
    }

    /**
     * Adds a boolean array field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addbooleanarray
     */
    AddBooleanArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBooleanArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a boolean array field with the specified field name, format, and tag.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addbooleanarray
     */
    AddBooleanArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddBooleanArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {HSTRING} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstring
     */
    AddString(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddString(name, value)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {HSTRING} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstring
     */
    AddStringWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddStringWithFormat(name, value, format)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {HSTRING} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstring
     */
    AddStringWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddStringWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstringarray
     */
    AddStringArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddStringArray(name, value_length, value)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstringarray
     */
    AddStringArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddStringArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addstringarray
     */
    AddStringArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddStringArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Guid} value Value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguid
     */
    AddGuid(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuid(name, value)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Guid} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguid
     */
    AddGuidWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuidWithFormat(name, value, format)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Guid} value Value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguid
     */
    AddGuidWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuidWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value The array values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguidarray
     */
    AddGuidArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuidArray(name, value_length, value)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) array field with the specified field name and format
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value The array values for the event field.
     * @param {Integer} format The format of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguidarray
     */
    AddGuidArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuidArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value The array values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addguidarray
     */
    AddGuidArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddGuidArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) field with the specified field name.
     * @param {HSTRING} name The name of the event field.
     * @param {DateTime} value The value of the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetime
     */
    AddDateTime(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTime(name, value)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {DateTime} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetime
     */
    AddDateTimeWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTimeWithFormat(name, value, format)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) field with the specified field name, format, and tags.
     * @param {HSTRING} name The name of the event field.
     * @param {DateTime} value The value of the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetime
     */
    AddDateTimeWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTimeWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) array field with the specified field name.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value The array of values for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetimearray
     */
    AddDateTimeArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTimeArray(name, value_length, value)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) array field with the specified field name and format.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetimearray
     */
    AddDateTimeArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTimeArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [DateTime](../windows.foundation/datetime.md) array field with the specified field name, format, and tags.
     * @param {HSTRING} name The name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value The array of values for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.adddatetimearray
     */
    AddDateTimeArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddDateTimeArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a time span field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {TimeSpan} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespan
     */
    AddTimeSpan(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpan(name, value)
    }

    /**
     * Adds a time span field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {TimeSpan} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespan
     */
    AddTimeSpanWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpanWithFormat(name, value, format)
    }

    /**
     * Adds a time span field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {TimeSpan} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespan
     */
    AddTimeSpanWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpanWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a time span array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespanarray
     */
    AddTimeSpanArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpanArray(name, value_length, value)
    }

    /**
     * Adds a time span array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespanarray
     */
    AddTimeSpanArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpanArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a time span array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addtimespanarray
     */
    AddTimeSpanArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddTimeSpanArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) field with the specified name.
     * @param {HSTRING} name Name of the event field.
     * @param {POINT} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpoint
     */
    AddPoint(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPoint(name, value)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) field with the specified name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {POINT} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpoint
     */
    AddPointWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPointWithFormat(name, value, format)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) field with the specified name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {POINT} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpoint
     */
    AddPointWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPointWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpointarray
     */
    AddPointArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPointArray(name, value_length, value)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpointarray
     */
    AddPointArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPointArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [Point](../windows.foundation/point.md) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addpointarray
     */
    AddPointArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddPointArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {SIZE} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsize
     */
    AddSize(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSize(name, value)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {SIZE} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsize
     */
    AddSizeWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSizeWithFormat(name, value, format)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {SIZE} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsize
     */
    AddSizeWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSizeWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) array field with the specified field name.
     * @param {HSTRING} name The name of the field.
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsizearray
     */
    AddSizeArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSizeArray(name, value_length, value)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsizearray
     */
    AddSizeArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSizeArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [Size](../windows.foundation/size.md) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addsizearray
     */
    AddSizeArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddSizeArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {RECT} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrect
     */
    AddRect(name, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRect(name, value)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) field with the specified field name, and format.
     * @param {HSTRING} name Name of the event field.
     * @param {RECT} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrect
     */
    AddRectWithFormat(name, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRectWithFormat(name, value, format)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {RECT} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrect
     */
    AddRectWithFormatAndTags(name, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRectWithFormatAndTags(name, value, format, tags)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) array field with the specified field name.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrectarray
     */
    AddRectArray(name, value_length, value) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRectArray(name, value_length, value)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) array field with the specified field name and format.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value The value for the event field.
     * @param {Integer} format The value for the event field.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrectarray
     */
    AddRectArrayWithFormat(name, value_length, value, format) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRectArrayWithFormat(name, value_length, value, format)
    }

    /**
     * Adds a [Rect](../windows.foundation/rect.md) array field with the specified field name, format, and tags.
     * @param {HSTRING} name Name of the event field.
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value The value for the event field.
     * @param {Integer} format The format of the event field. Specifies an optional formatting hint that may be used by Event Tracing for Windows (ETW) tools.
     * @param {Integer} tags The user-defined tag for the event field. Specifies up to twenty-eight bits of user-defined field processing metadata for use by a custom ETW processing tool. The top four bits are reserved and must be set to zero (0).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfields.addrectarray
     */
    AddRectArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if (!this.HasProp("__ILoggingFields")) {
            if ((queryResult := this.QueryInterface(ILoggingFields.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingFields := ILoggingFields(outPtr)
        }

        return this.__ILoggingFields.AddRectArrayWithFormatAndTags(name, value_length, value, format, tags)
    }

;@endregion Instance Methods
}
