#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR.ahk

/**
 * Contains fields that describe return parameters for the Identify Directive.
 * @remarks
 * This data structure is 4KB in size.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_identify_return_parameters
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * A [NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR](ns-nvme-nvme_directive_identify_return_parameters_descriptor.md) structure containing values that indicate which directives are supported.
     * @type {NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR}
     */
    DirectivesSupported{
        get {
            if(!this.HasProp("__DirectivesSupported"))
                this.__DirectivesSupported := NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR(0, this)
            return this.__DirectivesSupported
        }
    }

    /**
     * A [NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR](ns-nvme-nvme_directive_identify_return_parameters_descriptor.md) structure containing values that indicate which directives are enabled.
     * @type {NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR}
     */
    DirectivesEnabled{
        get {
            if(!this.HasProp("__DirectivesEnabled"))
                this.__DirectivesEnabled := NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR(32, this)
            return this.__DirectivesEnabled
        }
    }
}
