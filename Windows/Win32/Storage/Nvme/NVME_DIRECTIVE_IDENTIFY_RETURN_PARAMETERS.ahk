#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR.ahk" { NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR }

/**
 * Contains fields that describe return parameters for the Identify Directive.
 * @remarks
 * This data structure is 4KB in size.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_identify_return_parameters
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS {
    #StructPack 1

    /**
     * A [NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR](ns-nvme-nvme_directive_identify_return_parameters_descriptor.md) structure containing values that indicate which directives are supported.
     */
    DirectivesSupported : NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR

    /**
     * A [NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR](ns-nvme-nvme_directive_identify_return_parameters_descriptor.md) structure containing values that indicate which directives are enabled.
     */
    DirectivesEnabled : NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR

}
