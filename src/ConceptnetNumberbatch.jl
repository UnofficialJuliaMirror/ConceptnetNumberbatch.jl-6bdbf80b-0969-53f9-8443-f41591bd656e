# ConceptnetNumberbatch.jl - an interface for ConceptNetNumberbatch
#   written in Julia by Cornel Cofaru at 0x0α Research, 2018
#
# Paper:
#   Robert Speer, Joshua Chin, and Catherine Havasi (2017).
#       "ConceptNet 5.5: An Open Multilingual Graph of General Knowledge."
#       In proceedings of AAAI 2017.

module ConceptnetNumberbatch

using TranscodingStreams
using CodecZlib
using HDF5
using StringDistances
using NearestNeighbors
using Languages

import Base: getindex, size, length, show, keys, values, in

# Links pointing to the latest ConceptNetNumberbatch version (v"17.06")
const CONCEPTNET_MULTI_LINK = "https://conceptnet.s3.amazonaws.com/downloads/2017/numberbatch/numberbatch-17.06.txt.gz"
const CONCEPTNET_EN_LINK = "https://conceptnet.s3.amazonaws.com/downloads/2017/numberbatch/numberbatch-en-17.06.txt.gz"
const CONCEPTNET_HDF5_LINK = "https://conceptnet.s3.amazonaws.com/precomputed-data/2016/numberbatch/17.06/mini.h5"

# Accepted languages (map from conceptnet to Languages.Language)
const LANG_MAP = Dict(:en=>Languages.English(),
                      :fr=>Languages.French(),
                      :de=>Languages.German(),
                      :it=>Languages.Italian(),
                      :fi=>Languages.Finnish(),
                      :nl=>Languages.Dutch(),
                      :af=>Languages.Dutch(),
                      :pt=>Languages.Portuguese(),
                      :es=>Languages.Spanish(),
                      :ru=>Languages.Russian(),
                      :ro=>Languages.Romanian(),
                      :sw=>Languages.Swedish())

export CONCEPTNET_MULTI_LINK,
       CONCEPTNET_EN_LINK,
       CONCEPTNET_HDF5_LINK,
       ConceptNet,
       download_embeddings,
       load_embeddings,
       word_embeddings

include("interface.jl")
include("files.jl")
include("search.jl")

end # module
