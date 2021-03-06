# Copyright (c) 2012-2014 Snowplow Analytics Ltd. All rights reserved.
#
# This program is licensed to you under the Apache License Version 2.0,
# and you may not use this file except in compliance with the Apache License Version 2.0.
# You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the Apache License Version 2.0 is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.

# Authors::   Alex Dean (mailto:support@snowplowanalytics.com), Michael Tibben
# Copyright:: Copyright (c) 2012-2014 Snowplow Analytics Ltd
# License::   Apache License Version 2.0

require 'spec_helper'

Location = Sluice::Storage::S3::Location

describe Location do

  it 'should successfully initialize with a valid S3 (s3://) bucket' do
    loc = Location.new('s3://my-s3-bucket/')
    loc.bucket.should eql 'my-s3-bucket'
    loc.dir.should eql ''
    loc.dir_as_path.should eql ''
    loc.to_s.should eql 's3://my-s3-bucket/'
  end

  it 'should successfully initialize with a valid S3 (s3n://) bucket' do
    loc = Location.new('s3n://my-s3n-bucket/')
    loc.bucket.should eql 'my-s3n-bucket'
    loc.dir.should eql ''
    loc.dir_as_path.should eql ''
    loc.to_s.should eql 's3n://my-s3n-bucket/'
  end

  it 'should support object equality tests' do
    loc1 = Location.new('s3n://my-s3n-bucket/hello/blah/')
    loc2 = Location.new('s3n://my-s3n-bucket/hello/blah/')
    loc1.should eql loc2
    loc2.should eql loc1
    loc1.should == loc2
    loc2.should == loc1
  end

end